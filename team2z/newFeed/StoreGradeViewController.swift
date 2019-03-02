//
//  StoreGradeViewController.swift
//  team2z
//
//  Created by MOONJUNG on 19/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit
import SnapKit

class StoreGradeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var resultTableView: UITableView!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var firstView: WriteReview_1!
    @IBOutlet weak var secondView: WriteReview_2!
    @IBOutlet weak var thirdView: WriteReview_3!

    enum ViewState {
        case firstView
        case secondView
        case thirdView
    }
    var viewState : ViewState = ViewState.firstView
    var keyboardHeight: CGFloat = 0
    var nextButton: UIButton!

    /*lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        return picker
    }()*/

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "리뷰쓰기"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: makeBackButton())
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: makeNextButton())

        initSetting()
        setLayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    func makeBackButton() -> UIButton {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "left_arrow.png"), for: .normal)
        backButton.setTitle("", for: .normal)
        backButton.setTitleColor(backButton.tintColor, for: .normal)
        backButton.addTarget(self, action: #selector(self.backButtonPressed), for: .touchUpInside)
        return backButton
    }

    func makeNextButton() -> UIButton {
        self.nextButton = UIButton(type: .custom)
        self.nextButton.setTitle("다음", for: .normal)

        self.nextButton.setTitleColor(UIColor(red: 241.0/255.0, green: 90.0/255.0, blue: 36.0/255.0, alpha: 1.0), for: .normal)
        self.nextButton.addTarget(self, action: #selector(self.nextButtonPressed), for: .touchUpInside)
        return nextButton
    }

    @objc func loadFirstView() {
        self.nextButton.setTitle("다음", for: .normal)
        self.nextButton.sizeToFit()
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        self.viewState = ViewState.firstView
    }

    @objc func loadSecondView() {
        self.nextButton.setTitle("건너뛰기", for: .normal)
        self.nextButton.sizeToFit()
        self.scrollView.setContentOffset(CGPoint(x: 375, y: 0), animated: true)
        self.viewState = ViewState.secondView
    }

    @objc func loadThirdView() {
        self.nextButton.setTitle("완료", for: .normal)
        self.nextButton.sizeToFit()
        self.scrollView.setContentOffset(CGPoint(x: 750, y: 0), animated: true)
        self.thirdView.textReview.becomeFirstResponder()
        self.viewState = ViewState.thirdView
    }

    @objc func backButtonPressed() {

        switch viewState {

        case .firstView:
            self.navigationController?.popViewController(animated: true)

        case .secondView:
            loadFirstView()

        case .thirdView:
            loadSecondView()
        }
    }

    @objc func nextButtonPressed() {

        switch viewState {

        case .firstView:
            loadSecondView()

        case .secondView:
            loadThirdView()

        case .thirdView:
            print("end")
        }
    }

    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            keyboardHeight = keyboardRectangle.height


            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardHeight
            }

        }
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {

            let keyboardRectangle = keyboardFrame.cgRectValue
            keyboardHeight = keyboardRectangle.height

            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardHeight
            }

        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ResultStoreTableViewCell = tableView.dequeueReusableCell(withIdentifier: "result", for: indexPath) as! ResultStoreTableViewCell

        cell.storeName.text = "엽기 떡볶이 신촌점"
        cell.storeAddress.text = "서울특별시 중구"

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }


    func initSetting(){

        self.resultTableView.delegate = self
        self.resultTableView.backgroundColor = UIColor.white
        self.resultTableView.separatorStyle = .none
        self.resultTableView.dataSource = self
        self.scrollView.delegate = self
        self.scrollView.isPagingEnabled = false
        self.scrollView.isScrollEnabled = false
        self.resultTableView.register(ResultStoreTableViewCell.self, forCellReuseIdentifier: "result")
        self.resultTableView.rowHeight = 55

        self.view.addSubview(self.resultTableView)
        self.view.addSubview(self.lineView)
        self.view.addSubview(self.scrollView)

        self.firstView.comment_1.numberOfLines = 2
        self.firstView.comment_1.text = "방문하신 스토어\n어떠셨어요?"
        self.firstView.comment_1.textAlignment = .center
        self.firstView.comment_1.font = UIFont.boldSystemFont(ofSize: 23.0)

        self.firstView.ratingView.starSize = 40
        self.firstView.ratingView.settings.fillMode = .half
        self.firstView.ratingView.filledColor = UIColor.yellow
        self.firstView.ratingView.filledBorderColor = UIColor.gray
        self.firstView.ratingView.emptyColor = UIColor.gray
        self.firstView.ratingView.emptyBorderColor = UIColor.gray

        self.firstView.comment_2.text = "좋았어요!"
        self.firstView.comment_2.textAlignment = .center
        self.firstView.comment_2.textColor =  UIColor(red:74/255.0, green: 74/255.0, blue: 74/255.0, alpha: 1)
        self.firstView.comment_2.font = UIFont.systemFont(ofSize: 20)

        self.secondView.comment_3.numberOfLines = 2
        self.secondView.comment_3.text = "여기 떡볶이\n얼마나 매워요?"
        self.secondView.comment_3.textAlignment = .center
        self.secondView.comment_3.font = UIFont.boldSystemFont(ofSize: 24.0)

        self.secondView.spicyRating.starSize = 40
        self.secondView.spicyRating.filledColor = UIColor.yellow
        self.secondView.spicyRating.filledBorderColor = UIColor.gray
        self.secondView.spicyRating.emptyColor = UIColor.gray
        self.secondView.spicyRating.emptyBorderColor = UIColor.gray

        self.secondView.comment_4.text = "별로 안매워요."
        self.secondView.comment_4.textAlignment = .center
        self.secondView.comment_4.textColor = UIColor(red:74/255.0, green: 74/255.0, blue: 74/255.0, alpha: 1)
        self.secondView.comment_4.font = UIFont.systemFont(ofSize: 20)

        self.secondView.comment_5.numberOfLines = 2
        self.secondView.comment_5.text = "떡은\n밀떡? 쌀떡?"
        self.secondView.comment_5.textAlignment = .center
        self.secondView.comment_5.font = UIFont.boldSystemFont(ofSize: 24.0)

        self.secondView.mildduckBtn.setTitle("", for: .normal)
        self.secondView.mildduckBtn.setImage(UIImage(named: "ssaldduck_big"), for: .normal)

        self.secondView.ssaldduckBtn.setTitle("", for: .normal)
        self.secondView.ssaldduckBtn.setImage(UIImage(named: "ssaldduck_big"), for: .normal)

        self.secondView.comment_6.text = "밀떡이요"
        self.secondView.comment_6.textAlignment = .center
        self.secondView.comment_6.textColor =  UIColor(red:74/255.0, green: 74/255.0, blue: 74/255.0, alpha: 1)
        self.secondView.comment_6.font = UIFont.systemFont(ofSize: 20)

        self.secondView.comment_7.text = "쌀떡이요"
        self.secondView.comment_7.textAlignment = .center
        self.secondView.comment_7.textColor =  UIColor(red:74/255.0, green: 74/255.0, blue: 74/255.0, alpha: 1)
        self.secondView.comment_7.font = UIFont.systemFont(ofSize: 20)

        self.thirdView.textReview.placeholder = "리뷰를 작성해주세요"
        self.thirdView.textReview.text = ""
        self.thirdView.textReview.inputAccessoryView = UIView()
        self.thirdView.photoBtn.addTarget(self, action: #selector(self.clickPhotoButton(_:)), for: .touchUpInside)


        self.scrollView.addSubview(firstView)
        self.scrollView.addSubview(secondView)
        self.scrollView.addSubview(thirdView)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func clickPhotoButton(_ sender:UIButton){
       // self.present(self.imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage: UIImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            //self.imageView.image = editedImage
        }
        self.dismiss(animated: true, completion: nil)
    }

    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {

    }

    func setLayout(){

        self.resultTableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(65)
            make.left.equalTo(self.view)
            make.width.equalTo(375)
            make.height.equalTo(55)
        }

        self.lineView.snp.makeConstraints { (make) in
            make.width.equalTo(1125)
            make.height.equalTo(1)
            make.top.equalTo(resultTableView.snp.bottom)
            make.left.equalTo(self.view)
        }

        self.scrollView.snp.makeConstraints { (make) in
            make.width.equalTo(1125)
            make.height.left.equalTo(self.view)
            make.top.equalTo(lineView.snp.bottom)
        }

        self.firstView.snp.makeConstraints { (make) in
            make.width.equalTo(375)
            make.height.left.equalTo(self.view)
            make.top.equalTo(scrollView.snp.bottom)
        }

        self.firstView.comment_1.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(scrollView.snp.bottom).offset(30)
        }

        self.firstView.ratingView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(firstView.comment_1.snp.bottom).offset(40)
        }

        self.firstView.comment_2.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(firstView.ratingView.snp.bottom).offset(30)
        }

        self.secondView.snp.makeConstraints { (make) in
            make.width.equalTo(375)
            make.height.equalTo(self.view)
            make.left.equalTo(375)
            make.top.equalTo(scrollView.snp.bottom)
        }

        self.secondView.comment_3.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.secondView)
            make.top.equalTo(scrollView.snp.bottom).offset(30)
        }

        self.secondView.spicyRating.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.secondView)
            make.centerY.equalTo(secondView.comment_3.snp.bottom).offset(40)
        }

        self.secondView.comment_4.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.secondView)
            make.centerY.equalTo(secondView.spicyRating.snp.bottom).offset(30)
        }


        self.secondView.lineView.snp.makeConstraints { (make) in
            make.width.equalTo(375)
            make.height.equalTo(1)
            make.centerX.equalTo(self.secondView)
            make.centerY.equalTo(secondView.comment_4.snp.bottom).offset(15)
        }

        self.secondView.comment_5.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.secondView)
            make.centerY.equalTo(secondView.lineView.snp.bottom).offset(50)
        }

        self.secondView.mildduckBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.secondView).offset(-80)
            make.centerY.equalTo(secondView.comment_5.snp.bottom).offset(40)
            make.width.height.equalTo(40)
        }

        self.secondView.ssaldduckBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.secondView).offset(80)
            make.centerY.equalTo(secondView.comment_5.snp.bottom).offset(40)
            make.width.height.equalTo(40)
        }

        self.secondView.comment_6.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.secondView.mildduckBtn)
            make.centerY.equalTo(secondView.mildduckBtn.snp.bottom).offset(30)
        }

        self.secondView.comment_7.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.secondView.ssaldduckBtn)
            make.centerY.equalTo(secondView.mildduckBtn.snp.bottom).offset(30)
        }

        self.thirdView.snp.makeConstraints { (make) in
            make.width.equalTo(375)
            make.height.equalTo(self.view)
            make.left.equalTo(750)
            make.top.equalTo(scrollView.snp.bottom)
        }

        self.thirdView.textReview.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.thirdView)
            make.top.equalTo(scrollView.snp.bottom).offset(10)
            make.left.equalTo(self.thirdView).offset(10)
        }

        self.thirdView.bottomView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.thirdView)
            make.top.equalTo(self.thirdView).offset(455)
            make.left.equalTo(self.thirdView)
        }

    }


}
