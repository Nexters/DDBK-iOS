//
//  IntroductionViewController.swift
//  team2z
//
//  Created by 정인호 on 20/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit
import SnapKit
import UITextView_Placeholder

protocol SelectTagDelegate : class {
    func didSelectTag(introText: String)
}

class IntroductionViewController: UIViewController {
    
    weak var delegate: SelectTagDelegate?
    
    var introductionTextStr: String?

    let containerView = UIView()
    @IBOutlet weak var introductionTextView: UITextView!
//    let limitLetterSizeLabel = UILabel()
    let orangeColor = UIColor(red: 241.0/255.0, green: 90.0/255.0, blue: 36.0/255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "프로필 소개 편집"
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: makeBackButton())
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: makeSaveButton())
        
        introductionTextView.delegate = self
        introductionTextView.snp.makeConstraints { (make) in
            make.height.equalTo(self.view.snp.height).multipliedBy(0.4)
            make.top.bottom.left.right.equalTo(self.view)
        }
        introductionTextView.placeholder = "소개를 입력해주세요"
        introductionTextView.becomeFirstResponder()
        guard introductionTextStr == nil else {
            introductionTextView.text = introductionTextStr
            return
        }
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
        print("프로필 소개 텍스트 저장힙시다")
        if let passedData = introductionTextStr {
            delegate?.didSelectTag(introText: passedData)
        }
        // 마이페이지로 돌아가기
        navigationController?.popViewController(animated: true)
    }
    
    override var inputAccessoryView: UIView? {
        get {
            //Set up the container
            containerView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            containerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 60)
            
            let limitLetterSizeLabel = UILabel()
//            limitLetterSizeLabel.viewWithTag(0)
            limitLetterSizeLabel.accessibilityIdentifier = "limitLetterSizeLabel"
//            let introStrSize = introductionTextStr?.lengthOfBytes(using: .utf8)
//            limitLetterSizeLabel.text = (introStrSize?.stringValue)! + " / 70"
            limitLetterSizeLabel.text = ""
            limitLetterSizeLabel.textColor = #colorLiteral(red: 0.8078431373, green: 0.8078431373, blue: 0.8078431373, alpha: 1)
            containerView.addSubview(limitLetterSizeLabel)
            limitLetterSizeLabel.snp.makeConstraints { (make) in
                make.centerY.equalTo(containerView.snp.centerY)
                make.trailing.equalTo(containerView.snp.trailing).offset(-20)
            }
            
//            let textField = UITextField()
//            containerView.addSubview(textField)
//            textField.translatesAutoresizingMaskIntoConstraints = false
//            textField.placeholder = "Add a reframe..."
//            textField.textAlignment = .left
//            textField.backgroundColor = .white
//            textField.layer.cornerRadius = 50/2
//            textField.layer.masksToBounds = true
//            textField.borderStyle = .none
//            textField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8).isActive = true
//            textField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5).isActive = true
//            textField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
//            textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height)) // adding left padding so it's not sticked to border
//            textField.leftViewMode = .always
            
//            let arrow = UIImageView(image: #imageLiteral(resourceName: "arrowUp"))
//            containerView.addSubview(arrow)
//            arrow.translatesAutoresizingMaskIntoConstraints = false
//            arrow.trailingAnchor.constraint(equalTo: textField.trailingAnchor, constant: -10).isActive = true
//            arrow.centerYAnchor.constraint(equalTo: textField.centerYAnchor).isActive = true
            
//            let button = UIButton()
//            containerView.addSubview(button)
//            button.translatesAutoresizingMaskIntoConstraints = false
//            button.setTitle("🤗", for: .normal)
//            button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
//            button.leadingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 10).isActive = true
//            button.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8).isActive = true
//            button.centerYAnchor.constraint(equalTo: textField.centerYAnchor).isActive = true
            
            // Negative values for constraints can be avoided if we change order of views when applying constrains
            // f.e. instead of button.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8).isActive = true
            // write containerView.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: 8).isActive = true
            
            return containerView
        }
    }
}

extension IntroductionViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        introductionTextStr = textView.text
        let introStrSize = introductionTextStr?.lengthOfBytes(using: .utf8)
        print((introStrSize?.stringValue)! + " / 70")
//        limitLetterSizeLabel.text = (introStrSize?.stringValue)! + " / 70"
    
        
        let limitLetterSizeLabel = self.containerView.subviews[0] as? UILabel
        limitLetterSizeLabel?.text = (introStrSize?.stringValue)! + " / 70"
        self.view.setNeedsDisplay()
        limitLetterSizeLabel?.setNeedsDisplay()
    }
}

extension Int {
    var stringValue:String {
        return "\(self)"
    }
}
