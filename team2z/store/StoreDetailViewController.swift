//
//  StoreDetailViewController.swift
//  team2z
//
//  Created by 정인호 on 19/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit
import SMSegmentView
import Floaty

class StoreDetailViewController: UIViewController {
    let myTableView: UITableView = UITableView(frame: CGRect.zero, style: .grouped)
    var segmentView: SMSegmentView?
    let floaty = Floaty()
    
    let orangeColor = UIColor(red: 241.0/255.0, green: 90.0/255.0, blue: 36.0/255.0, alpha: 1.0)
    
    var isAddedWantToGo = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = ""
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        self.navigationController?.navigationBar.backgroundColor = .white
        // White color Background + Red Color Title
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: orangeColor]
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: makeBackButton())
        
        // 테이블뷰 생성 및 설정
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        //        self.myTableView.isScrollEnabled = false
        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.view.addSubview(self.myTableView)
        self.myTableView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalTo(self.view)
        }
        // 테이블 뷰 border 없애기
//        self.myTableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: myTableView.frame.size.width, height: 1))
        
        // 플로팅 액션 버튼 설정
        floaty.buttonImage = UIImage(named: "floating_review")!
        floaty.buttonColor = orangeColor
        floaty.addItem("", icon: UIImage(named: "mypage_ddbk")!)
        floaty.fabDelegate = self
        self.view.addSubview(floaty)
        
        // 세그먼트 뷰 초기화
        self.initializeSegmentView()
        
        // xib 커스텀 셀 등록
        let nibName_0 = UINib(nibName: "StoreCommonTableViewCell", bundle: nil)
        myTableView.register(nibName_0, forCellReuseIdentifier: "StoreCommonCell")
        let nibName_1 = UINib(nibName: "UserFollowTableViewCell", bundle: nil)
        myTableView.register(nibName_1, forCellReuseIdentifier: "UserFollowCell")
        let nibName_2 = UINib(nibName: "ReviewTableViewCell", bundle: nil)
        myTableView.register(nibName_2, forCellReuseIdentifier: "ReviewTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: orangeColor]
        floaty.close()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }

    func makeBackButton() -> UIButton {
        //        let backButtonImage = UIImage(named: "left_arrow.png")?.withRenderingMode(.alwaysTemplate)
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "left_arrow.png"), for: .normal)
        backButton.setTitle("", for: .normal)
        backButton.setTitleColor(backButton.tintColor, for: .normal)
        backButton.addTarget(self, action: #selector(self.backButtonPressed), for: .touchUpInside)
        return backButton
    }
    
    @objc func backButtonPressed() {
        //        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func addWantToGoAction(sender: UIButton) {
        // 가고싶어요 목록에 가게 추가
        
        // 성공하면 버튼 이미지, 타이틀 색깔 변경
        if isAddedWantToGo {
            isAddedWantToGo = false
            sender.setImage(UIImage(named: "pin_white"), for: .normal)
            sender.setTitle(" 가고싶어요에 추가", for: .normal)
            sender.setTitleColor(.white, for: .normal)
            sender.backgroundColor = orangeColor
            sender.layer.borderColor = UIColor.clear.cgColor
        } else {
            isAddedWantToGo = true
            sender.setImage(UIImage(named: "pin_gray"), for: .normal)
            sender.setTitleColor(UIColor(red: 155.0/255.0, green: 155.0/255.0, blue: 155.0/255.0, alpha: 1.0), for: .normal)
            sender.setTitle(" 가고싶어요에 추가됨", for: .normal)
//            sender.tintColor = UIColor(red: 155.0/255.0, green: 155.0/255.0, blue: 155.0/255.0, alpha: 1.0)
            sender.backgroundColor = .white
            sender.layer.borderColor = UIColor(red: 155.0/255.0, green: 155.0/255.0, blue: 155.0/255.0, alpha: 1.0).cgColor
        }
        
        
    }
}

extension StoreDetailViewController: UITableViewDelegate {
    
}
extension StoreDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            switch segmentView!.selectedSegmentIndex {
            case 0:
                print("왔다갔어요 테이블 셀을 만듭니다.")
                return 5
            default:
                print("인생떡볶이집 테이블 셀을 만듭니다.")
                return 10
            }
//            return 1
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let headerCell = tableView.dequeueReusableCell(withIdentifier: "StoreCommonCell") as! StoreCommonTableViewCell
            headerCell.selectionStyle = .none
            headerCell.StoreFooterUIView.ratingLabel?.text = "2.8"
            headerCell.StoreFooterUIView.cosmosView.rating = 2.8
            headerCell.nameLabel.textColor = UIColor(red: 241.0/255.0, green: 90.0/255.0, blue: 36.0/255.0, alpha: 1.0)
            headerCell.nameLabel.font = headerCell.nameLabel.font.withSize(22)
            headerCell.addressLabel.textColor = UIColor(red: 74.0/255.0, green: 74.0/255.0, blue: 74.0/255.0, alpha: 1.0)
            headerCell.verticalLineView.backgroundColor = UIColor(red: 243.0/255.0, green: 243.0/255.0, blue: 243.0/255.0, alpha: 1.0)
            headerCell.phoneNumberLabel?.text = "02-123-1234"
            headerCell.arrowLabel.textColor = .clear
            headerCell.centerLineView.backgroundColor = .clear
            
            // 가고싶어요 추가 버튼 생성 및 설정
            let addWantToGoButton = UIButton()
            addWantToGoButton.setImage(UIImage(named: "pin_white"), for: .normal)
            addWantToGoButton.setTitle(" 가고싶어요에 추가", for: .normal)
            addWantToGoButton.tintColor = .white
            addWantToGoButton.backgroundColor = orangeColor
            // 둥근 버튼 만들기
            addWantToGoButton.layer.cornerRadius = 5
            addWantToGoButton.layer.borderWidth = 1
            addWantToGoButton.layer.borderColor = UIColor.clear.cgColor
            headerCell.addSubview(addWantToGoButton)
            addWantToGoButton.snp.makeConstraints { (make) in
                make.width.equalTo(headerCell.centerLineView.snp.width)
                make.height.equalTo(headerCell.snp.height).multipliedBy(0.22)
                make.centerX.equalTo(headerCell.snp.centerX)
                make.bottom.equalTo(headerCell.snp.bottom).offset(-11)
            }
            
            addWantToGoButton.addTarget(self, action: #selector(self.addWantToGoAction), for: .touchUpInside)
            
            return headerCell
        }
//        return UITableViewCell() // 제거해
        switch segmentView!.selectedSegmentIndex {
        case 0: // 왔다갔어요
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell") as! ReviewTableViewCell
            cell.selectionStyle = .none
//            let cell = tableView.dequeueReusableCell(withIdentifier: "UserFollowCell") as! UserFollowTableViewCell
//            cell.profileImageView.image = UIImage(named: "profile_default_male")


//            cell.StoreFooterUIView.ratingLabel?.text = "2.8"
//            cell.StoreFooterUIView.cosmosView.rating = 2.8
//            cell.nameLabel.textColor = UIColor(red: 241.0/255.0, green: 90.0/255.0, blue: 36.0/255.0, alpha: 1.0)
//            cell.nameLabel.font = cell.nameLabel.font.withSize(22)
//            cell.addressLabel.textColor = UIColor(red: 74.0/255.0, green: 74.0/255.0, blue: 74.0/255.0, alpha: 1.0)
//            cell.verticalLineView.backgroundColor = UIColor(red: 243.0/255.0, green: 243.0/255.0, blue: 243.0/255.0, alpha: 1.0)
//            cell.phoneNumberLabel?.text = "02-123-1234"
//            cell.arrowLabel.textColor = .clear

            return cell
        default: // 인생떡볶이집
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "UserFollowCell") as! UserFollowTableViewCell
            cell2.profileImageView.image = UIImage(named: "profile_default_male")

            return cell2
        }

    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return " "
//    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat.leastNormalMagnitude
        default:
            return 35.0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //Return UiView
        return segmentView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        let view:UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.size.width, height: 10))
        view.backgroundColor = .clear

        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.navigationController?.pushViewController(StoreDetailViewController(), animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0: // 가게정보 셀
            return 160.0
        default:
            switch segmentView!.selectedSegmentIndex {
            case 0: // 왔다갔어요 세그먼트
                return UIScreen.main.bounds.width * 1.2347
            default: // 인생떡볶이집 세그먼트
                return 60.0
            }
//            return 60.0
        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            self.title = "떡볶이집이름으로변경"
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            self.title = ""
        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        if section == 0 {
            self.title = "떡볶이집이름으로변경"
        }
    }
    
    @objc func selectSegmentInSegmentView(segmentView: SMSegmentView) {
        /*
         Replace the following line to implement what you want the app to do after the segment gets tapped.
         */
        print("Select segment at index: \(segmentView.selectedSegmentIndex)")
        myTableView.reloadData()
        switch segmentView.selectedSegmentIndex {
        case 0:
            break
        default:
            break
        }
    }

    private func initializeSegmentView() {
        let appearance = SMSegmentAppearance()
        appearance.segmentOnSelectionColour = UIColor(red: 241.0/255.0, green: 90.0/255.0, blue: 36.0/255.0, alpha: 1.0)
        appearance.segmentOffSelectionColour = .white
        appearance.titleOnSelectionFont = UIFont.systemFont(ofSize: 13.0)
        appearance.titleOffSelectionFont = UIFont.systemFont(ofSize: 13.0)
        appearance.contentVerticalMargin = 10.0

        let segmentFrame = CGRect(x: 0, y: 120.0, width: self.view.frame.size.width - 0*2, height: 40.0)
        segmentView = SMSegmentView(frame: segmentFrame, dividerColour: UIColor(white: 0.95, alpha: 0.3), dividerWidth: 1.0, segmentAppearance: appearance)
        //        segmentView.backgroundColor = UIColor.clear
        //        segmentView.layer.cornerRadius = 5.0
        //        segmentView.layer.borderColor = UIColor(white: 0.85, alpha: 1.0).cgColor
        //        segmentView.layer.borderWidth = 1.0
        segmentView!.addSegmentWithTitle("왔다갔어요", onSelectionImage: UIImage(named: "store_detail_seg_2_selected"), offSelectionImage: UIImage(named: "store_detail_seg_1"))
        segmentView!.addSegmentWithTitle("인생떡볶이집", onSelectionImage: UIImage(named: "store_detail_seg_2_selected"), offSelectionImage: UIImage(named: "store_detail_seg_1"))
        segmentView!.addTarget(self, action: #selector(selectSegmentInSegmentView(segmentView:)), for: .valueChanged)

        segmentView!.selectedSegmentIndex = 0
    }
}

extension StoreDetailViewController: FloatyDelegate {
    // MARK: - Floaty Delegate Methods
    func floatyWillOpen(_ floaty: Floaty) {
        print("Floaty Will Open")
        
    }
    
    func floatyDidOpen(_ floaty: Floaty) {
        print("Floaty Did Open")
        self.navigationController?.pushViewController(DummyViewController(), animated: true)
    }
    
    func floatyWillClose(_ floaty: Floaty) {
        print("Floaty Will Close")
    }
    
    func floatyDidClose(_ floaty: Floaty) {
        print("Floaty Did Close")
    }
}
