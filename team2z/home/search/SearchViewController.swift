//
//  SearchViewController.swift
//  team2z
//
//  Created by 정인호 on 22/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit
import Alamofire
import CoreSpotlight
import MobileCoreServices

protocol HomeSearchControllerDelegate : class {
    func didPressButton(controller: SearchViewController)
//    func didPressReturnButton(controller: SearchResultViewController)
    func didPressReturnButton(controller: ResultSearchViewController)
}

class Candy {
    var category: String
    var name: String
    
    init(category: String, name: String) {
        self.category = category
        self.name = name
    }
}

class SearchViewController: UIViewController {
    
    var delegateHomeSearchControllerDelegate: HomeSearchControllerDelegate?
    
    @IBOutlet weak var backButton: UIButton! // 0.146
    @IBOutlet weak var searchBar: UISearchBar! // 0.854
    @IBOutlet weak var firstLineView: UIView!
    
    var myTableView: UITableView = UITableView(frame: CGRect.zero, style: .grouped)
    var homeSearchHistory = UserDefaults.standard.array(forKey: "homeSearchHistory"){
        didSet {
            print("Saving homeSearchHistory which is now \(String(describing: homeSearchHistory))")
            DispatchQueue.main.async {
                UserDefaults.standard.set(self.homeSearchHistory, forKey: "homeSearchHistory")
            }
            
        }
    }
    
    var storeNames = [String]()
    var candies = [
        Candy(category:"Chocolate", name:"Chocolate Bar"),
        Candy(category:"Chocolate", name:"Chocolate Chip"),
        Candy(category:"Chocolate", name:"Dark Chocolate"),
        Candy(category:"Hard", name:"Lollipop"),
        Candy(category:"Hard", name:"Candy Cane"),
        Candy(category:"Hard", name:"Jaw Breaker"),
        Candy(category:"Other", name:"Caramel"),
        Candy(category:"Other", name:"Sour Chew"),
        Candy(category:"Other", name:"Gummi Bear"),
        Candy(category:"Other", name:"Candy Floss"),
        Candy(category:"Chocolate", name:"Chocolate Coin"),
        Candy(category:"Chocolate", name:"Chocolate Egg"),
        Candy(category:"Other", name:"Jelly Beans"),
        Candy(category:"Other", name:"Liquorice"),
        Candy(category:"Hard", name:"Toffee Apple")
    ]
    
    var historyCandies = [Candy]()
    var searchStoreNames = [String]()
    var searchCandies = [Candy]()
    var searching = false
    var searchKeyword = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getStoreInfomation()
        
        self.myTableView.backgroundColor = .white
        
        searchBar.layoutIfNeeded()
        searchBar.delegate = self
        
        let searchTextField:UITextField = searchBar.subviews[0].subviews.last as! UITextField
        searchTextField.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 13.0)
//        searchTextField.textColor = UIColor(red: 206.0/255.0, green: 206.0/255.0, blue: 206.0/255.0, alpha: 1.0)
        searchTextField.layer.cornerRadius = 15
        searchTextField.textAlignment = NSTextAlignment.left
        let image:UIImage = UIImage(named: "search_cell_icon")!
        let imageView:UIImageView = UIImageView.init(image: image)
        searchTextField.leftView = nil
        searchTextField.placeholder = "리뷰어 또는 스토어를 검색하세요"
        searchTextField.rightView = imageView
        searchTextField.rightViewMode = UITextField.ViewMode.always
//        searchTextField.backgroundColor = .green
        //
        searchBar.becomeFirstResponder()
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = UIColor.white.cgColor
        searchBar.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.snp.width).multipliedBy(0.91)
            make.height.equalTo(40)
            make.top.equalTo(self.view.snp.bottom)
            make.leading.equalTo(backButton.snp.trailing)
        }
        // 수평선 뷰 설정
        firstLineView.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.snp.width)
            make.height.equalTo(1)
            make.top.equalTo(searchBar.snp.bottom)
            make.centerX.equalTo(self.view.snp.centerX)
        }

        // 테이블뷰 생성 및 설정
        self.myTableView.separatorStyle = .none
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        let HEADER_HEIGHT = 100
        myTableView.tableHeaderView?.frame.size = CGSize(width: myTableView.frame.width, height: CGFloat(HEADER_HEIGHT))
        self.view.addSubview(self.myTableView)
        self.myTableView.snp.makeConstraints { (make) in
            make.top.equalTo(firstLineView.snp.bottom)
            make.bottom.left.right.equalTo(self.view)
        }
        
        backButton.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.snp.width).multipliedBy(0.09)
            make.height.equalTo(40)
            make.bottom.equalTo(myTableView.snp.top)
        }
        
        
        // xib 커스텀 셀 등록
        let nibName_0 = UINib(nibName: "SearchTableViewCell", bundle: nil)
        myTableView.register(nibName_0, forCellReuseIdentifier: "SearchTableViewCell")
    }

    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        view.endEditing(true)
        dismiss(animated: true, completion: nil)
    }
    
    private func getStoreInfomation(){
        AF.request("https://api.2z.kohmlab.com/stores").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
//                print("JSON: \(json)") // serialized json response
                print("JSON type: \(type(of: json))")
                if let array = json as? [[String : AnyObject]]{
                    for item in array {
                        print(item["name"])
                        self.storeNames.append(item["name"] as! String)
                    }
                }
            }
            
            self.indexSearchableItems()
//            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)") // original server data as UTF8 string
//            }
        }
        
//        AF.request("http://ddbk-2114139714.ap-northeast-2.elb.amazonaws.com/stores").response { response in
//            print("Request: \(response.request)")
//            print("Response: \(response.response)")
//            print("Error: \(response.error)")
//
//            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)")
//            }
//        }
    }
    
    func indexSearchableItems(){
        //let matches ...
        var searchableItems = [CSSearchableItem]()
        
        let matches = storeNames
        var i = 0
        
        for match in matches {
            var matchId = match
            matchId.append(contentsOf: String(i))
            i += 1
            
            let searchItemAttributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
            searchItemAttributeSet.title = match
//            searchItemAttributeSet.contentDescription = match.content
//            searchItemAttributeSet.thumbnailData = match.image
            
            let searchableItem = CSSearchableItem(uniqueIdentifier: matchId, domainIdentifier: "matches", attributeSet: searchItemAttributeSet)
            searchableItems.append(searchableItem)
        }
        
        CSSearchableIndex.default().indexSearchableItems(searchableItems) { (error) -> Void in
            if error != nil {
                print(error?.localizedDescription ?? "Error")
            }
        }
    }
    
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
//            return searchCandies.count
            return searchStoreNames.count
        } else {
            return homeSearchHistory!.count
        }
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell") as! SearchTableViewCell
        if searching {
//            cell.keywordLabel?.text = searchCandies[indexPath.row].name
            cell.keywordLabel?.text = searchStoreNames[indexPath.row]
            cell.deleteButton.isHidden = true
        } else {
            // 최근 검색어 보여주기
            cell.cellDelegate = self
            cell.keywordLabel?.text = (homeSearchHistory![indexPath.row] as! String)
            cell.keywordIndexOfHistory = indexPath.row
            cell.deleteButton.isHidden = false
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searching {
            goToSearchResultAction(searchBarText: searchStoreNames[indexPath.row])
        } else {
            goToSearchResultAction(searchBarText: homeSearchHistory?[indexPath.row] as! String)
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let headerLabel = UILabel()
        headerLabel.text = "최근 검색"
        headerView.addSubview(headerLabel)
        headerLabel.snp.makeConstraints { (make) in
            make.width.equalTo(headerView.snp.width).multipliedBy(0.5)
            make.leading.equalTo(headerView.snp.leading).offset(21)
            make.centerY.equalTo(headerView.snp.centerY)
        }
        //Return UiView
        return headerView
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "   "
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if searching {
            return CGFloat.leastNormalMagnitude
        } else {
            return 40.0
        }
    }
    
}


extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0 {
            searching = false
        } else {
//            searchCandies = candies.filter( { $0.name.prefix(searchText.count) == searchText} )
            searchStoreNames = storeNames.filter( { $0.prefix(searchText.count) == searchText} )
            searching = true
        }
        
        myTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searchButtonClicked" +  searchBar.text!)
        goToSearchResultAction(searchBarText: searchBar.text!)
    }
    
    func goToSearchResultAction(searchBarText: String) {
        let filteredIndices = homeSearchHistory?.indices.filter ({homeSearchHistory?[$0] as! String == searchBarText})
        
        if (filteredIndices?.count)! > 0{
            print("이미 히스토리에 존재하는 검색어입니다.")
            homeSearchHistory?.remove(at: filteredIndices![0])
            homeSearchHistory?.insert(searchBarText, at: 0)
            
        } else {
            print("히스토리에 존재하지 않으므로 히스토리에 추가합니다.")
            homeSearchHistory?.insert(searchBarText, at: 0)
        }
        
        searchKeyword = searchBarText
        delegateHomeSearchControllerDelegate?.didPressButton(controller: self)
    }
}

extension SearchViewController: HomeSearchCellDelegate {
    func didPressButton(_ tag: Int) {
        print("I have pressed a delete button(검색어 지우기) with a tag: \(tag)")
    }
    
    func didPressDeleteButton(cell: SearchTableViewCell) {
//        print(cell.keywordIndexOfHistory)
        homeSearchHistory?.remove(at: cell.keywordIndexOfHistory!)
        myTableView.reloadData()
    }
    
}
