//
//  NewFeedViewController.swift
//  team2z
//
//  Created by 김대섭 on 2019. 2. 16..
//  Copyright © 2019년 TeamNexters. All rights reserved.
//

import UIKit
import SnapKit

class NewFeedViewController: UIViewController, UISearchBarDelegate{
    
    // variable
    private var naviBar: UINavigationBar!
    private var storeIcon: UIButton!
    /*private var storeImageView: UIImageView! // 가게 or 음식 사진 (1장)
    private var reviewTextView: UITextView! // 리뷰 작성칸
    private var storeName: UILabel! // 가게 이름
    private var saveButton: UIButton! // 저장 버튼
    private var storeGrade: Float? // 점수*/
    
    private var searchStoreBar: UISearchBar!
    
    
    /*private lazy var storeImagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        return picker
    }()*/

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarLayout()
        initLayout()
        setAutoLayout()
        
        //clickEvent()
    }
    
    // navigation
    func navigationBarLayout(){
        self.naviBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 44))
        let backBarButton = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: nil)
        let navigationItem = UINavigationItem()
        navigationItem.title = "리뷰 쓰기"
        navigationItem.leftBarButtonItem = backBarButton
        naviBar.items = [navigationItem]
        self.view.addSubview(naviBar)
    }
    
    // init
    func initLayout(){
        searchStoreBar = UISearchBar()
        self.searchStoreBar.delegate = self
        self.searchStoreBar.placeholder = "스토어를 검색하세요"
        storeIcon = UIButton()
        
        storeIcon.backgroundColor = UIColor.black
        self.view.backgroundColor = UIColor.white
        
        
        self.view.addSubview(storeIcon)
        self.view.addSubview(searchStoreBar)
        /*storeImageView = UIImageView()
        reviewTextView = UITextView()
        
        self.reviewTextView.delegate = self
        storeImageView.isUserInteractionEnabled = true
        
        self.view.addSubview(baseView)
        self.baseView.addSubview(storeImageView)
        self.baseView.addSubview(reviewTextView)*/
    }
    
    // 배치헬프 ㅜ
    func setAutoLayout(){
        
        self.storeIcon.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(15)
            make.top.equalTo(self.naviBar).offset(60)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        self.searchStoreBar.snp.makeConstraints { (make) in
            make.left.equalTo(self.storeIcon).offset(40)
            make.top.equalTo(self.naviBar).offset(60)
            make.width.equalTo(310)
            make.height.equalTo(30)
        }
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    
    /*
    
    // click event & target-action
    func clickEvent(){
        let imageTapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.selectStoreImage(_:)))
        self.storeImageView.addGestureRecognizer(imageTapGesture)
    }
    
    @IBAction func selectStoreImage(_ sender:UITapGestureRecognizer){
        self.present(self.storeImagePicker, animated: true, completion: nil)
    }
    
    
    // imagePicker method
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectImage: UIImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.storeImageView.image = selectImage
        }
        self.dismiss(animated: true, completion: nil)
    }
 
 */
}
