//
//  WriteReviewFinal.swift
//  team2z
//
//  Created by MOONJUNG on 23/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit

class WriteReviewFinal: UIView, UITextViewDelegate,
UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private let xibName = "WriteReviewFinal"
    @IBOutlet weak var reviewText: UITextView!
    let containerView = UIView()
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        return picker
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
        initItems()
        snapkitLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
        initItems()
        snapkitLayout()
    }
    
    private func initItems(){
        self.reviewText.placeholder = "리뷰를 작성해주세요"
        self.reviewText.text = ""
        self.reviewText.font = self.reviewText.font!.withSize(16)
        //self.reviewText.inputAccessoryView = ToolbarCell()//PhotoToolbar()
        
    }
    
    private func snapkitLayout(){
        self.reviewText.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.width.left.equalTo(self)
            make.height.equalTo(100)
        }
    }

    private func commonInit(){
        let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    //view.frame.width
    
    override var inputAccessoryView: UIView? {
        get {
            //Set up the container
            containerView.backgroundColor = UIColor(red: 248.0/255.0, green: 248.0/255.0, blue: 248.0/255.0, alpha: 1.0)
            containerView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 40)
            
            let selectPhoto = UIButton()
            selectPhoto.addTarget(self, action: #selector(self.touchImageButton(_:)), for: .touchUpInside)
            selectPhoto.setTitle("사진첨부", for: .normal)
            selectPhoto.setTitleColor(.black, for: .normal)
            containerView.addSubview(selectPhoto)
            selectPhoto.snp.makeConstraints { (make) in
                make.centerY.equalTo(containerView.snp.centerY)
                make.leading.equalTo(containerView.snp.leading).offset(20)
            }
            
            return containerView
        }

    }
    
    @IBAction func touchImageButton(_ sender:UITapGestureRecognizer){
        let test = UIApplication.shared.keyWindow?.rootViewController
        test?.present(self.imagePicker, animated: true, completion: nil)
         //self.present(self.imagePicker, animated: true, completion: nil)
    }
}
