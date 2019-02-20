//
//  ProfileModifyViewController.swift
//  team2z
//
//  Created by 정인호 on 20/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit
import SnapKit

class ProfileModifyViewController: UIViewController {
    
    let myTableView: UITableView = UITableView(frame: CGRect.zero, style: .grouped)
    let myTableHeaderView = UIView()
    let picker = UIImagePickerController()
    
    
    let infoLabel = ["이름", "소개", "인생 떡볶이집"]
    let varInfoPlaceHolerStr = ["이름을 입력해주세요", "소개를 작성하세요", "인생 떡볶이 맛집을 등록하세요"]
    let orangeColor = UIColor(red: 241.0/255.0, green: 90.0/255.0, blue: 36.0/255.0, alpha: 1.0)
    
    var introductionTextStr: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "프로필 편집"
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: makeBackButton())
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: makeSaveButton())
        
        
        // 테이블뷰 생성 및 설정
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        self.myTableView.isScrollEnabled = false
        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.view.addSubview(self.myTableView)
        self.myTableView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalTo(self.view)
        }
        
        picker.delegate = self
        
        let nibName_1 = UINib(nibName: "ProfileInfoTableViewCell", bundle: nil)
        myTableView.register(nibName_1, forCellReuseIdentifier: "ProfileInfoCell")
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
    
    func makeSaveButton() -> UIButton {
        let backButton = UIButton(type: .custom)
        backButton.setTitle("완료", for: .normal)
        backButton.setTitleColor(orangeColor, for: .normal)
        backButton.addTarget(self, action: #selector(self.saveButtonPressed), for: .touchUpInside)
        return backButton
    }
    
    @objc func backButtonPressed() {
        //        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func saveButtonPressed() {
        print("프로필 정보 저장힙시다")
        
        let modifiedName = (myTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! ProfileInfoTableViewCell).infoTextField?.text
        let modifiedIntroduction = (myTableView.cellForRow(at: IndexPath(row: 1, section: 0)) as! ProfileInfoTableViewCell).infoTextField?.text
        
        print("변경할 이미지: ")
        print("변경할 이름: \(String(describing: modifiedName))")
        print("변경할 소개: \(String(describing: modifiedIntroduction))")
        print("변경할 인생 떡볶이집: ")
        // 마이페이지로 돌아가기
        navigationController?.popViewController(animated: true)
    }
    
    @objc func profileImageModifyButtonPressed() {
        print("사진 선택 해야함")
        let alert =  UIAlertController(title: "프로필 이미지 변경", message: "", preferredStyle: .actionSheet)
    
        let library =  UIAlertAction(title: "사진앨범", style: .default) { (action) in self.openLibrary()
        }
        let camera =  UIAlertAction(title: "카메라", style: .default) { (action) in
            self.openCamera()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)

        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)

        present(alert, animated: true, completion: nil)
    }

}

extension ProfileModifyViewController: UITableViewDelegate {
    
}
extension ProfileModifyViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileInfoCell") as! ProfileInfoTableViewCell
        cell.selectionStyle = .none
        cell.infoLabel?.text = infoLabel[indexPath.row]
        cell.infoTextField?.placeholder = varInfoPlaceHolerStr[indexPath.row]
        
        switch indexPath.row {
        case 0:
            break
        case 1:
            cell.infoTextField?.isEnabled = false
            break
        default:
            cell.infoTextField?.isEnabled = false
            break
        }
        return cell
        
    }
    
    //    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        return " "
    //    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 190.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // 프로필 사진 이미지뷰
        let profileImageView = UIImageView(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(110), height: CGFloat(110)))
//        profileImageView.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(110), height: CGFloat(110))
        
        do {
            let url = URL(string: "https://via.placeholder.com/150/92c952")
            let data = try Data(contentsOf: url!)
            
            profileImageView.image = UIImage(data: data)
        } catch {
            profileImageView.image = UIImage(named: "profile_default_male")
        }
        
        
        profileImageView.layer.borderWidth = 2
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.borderColor = UIColor(red: 241.0/255.0, green: 90.0/255.0, blue: 36.0/255.0, alpha: 1.0).cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.clipsToBounds = true
        
        // 프로필 사진 바꾸기 버튼
        let profileImageModifyButton = UIButton()
        profileImageModifyButton.setTitle("프로필 사진 바꾸기", for: .normal)
        profileImageModifyButton.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(110), height: CGFloat(35))
        profileImageModifyButton.setTitleColor(self.orangeColor, for: .normal)
        profileImageModifyButton.titleLabel?.adjustsFontSizeToFitWidth = true
//        profileImageModifyButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        profileImageModifyButton.addTarget(self, action: #selector(self.profileImageModifyButtonPressed), for: .touchUpInside)

        //Create UIView and Setup UIView
        
        myTableHeaderView.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(365), height: CGFloat(60))
//        view.backgroundColor = UIColor.white


        //Add Button In UIView
        myTableHeaderView.addSubview(profileImageView)
        myTableHeaderView.addSubview(profileImageModifyButton)
        
        profileImageView.snp.makeConstraints { (make) in
            make.width.equalTo(110)
            make.height.equalTo(profileImageView.snp.width)
            make.top.equalTo(myTableHeaderView.snp.top).offset(27)
            make.centerX.equalTo(myTableHeaderView.snp.centerX)
        }

        profileImageModifyButton.snp.makeConstraints { (make) in
            make.width.equalTo(profileImageView.snp.width)
            make.height.equalTo(22)
            make.top.equalTo(profileImageView.snp.bottom).offset(15)
            make.centerX.equalTo(myTableHeaderView.snp.centerX)
        }
        
        return myTableHeaderView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let view:UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.size.width, height: 10))
        view.backgroundColor = .clear
        
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            let vc = IntroductionViewController(nibName: "IntroductionViewController", bundle: nil)
            vc.delegate = self
            vc.introductionTextStr = "안녕하세요?! 떡찐입니다."
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 2:
            break
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    
}

extension ProfileModifyViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func openLibrary(){
        
        picker.sourceType = .photoLibrary
        
        present(picker, animated: false, completion: nil)
        
    }
    
    func openCamera(){
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            picker.sourceType = .camera
            present(picker, animated: false, completion: nil)
        } else{
            print("Camera not available")
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 사진을 선택하고 나서 해야할 작업 구현
        if let profileImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            
            print(info)
            // 프로필 이미지 뷰를 선택한 사진으로 변경
            let imageView = myTableHeaderView.subviews[0] as? UIImageView
            imageView?.image = profileImage
            // 선택한 사진의 정보를 저장
            
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    

}

extension ProfileModifyViewController: SelectTagDelegate {
    func didSelectTag(introText: String) {
        let introTextField = myTableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? ProfileInfoTableViewCell
        introTextField?.infoTextField.text = introText
    }
}
