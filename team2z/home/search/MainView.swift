//
//  MainView.swift
//  team2z
//
//  Created by 정인호 on 22/02/2019.
//  Copyright © 2019 TeamNexters. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupUI() {
        backgroundColor = UIColor.lightGray
        setupSubViews()
        setupAutoLayout()
    }
    
    // MARK: Initialize UI Elements
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.isTranslucent = false
        searchBar.barTintColor = .white
        searchBar.layoutIfNeeded()
        return searchBar
    }()
    
    private let searchImageView: UIImageView = {
        let image = UIImage(named: "search_cell_icon")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var searchBarTextField: UITextField = { [unowned self] in
        let textField = self.searchBar.value(forKey: "searchBarTextField") as! UITextField
        textField.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 24)
        textField.textColor = .gray
        textField.tintColor = .gray
        textField.clearButtonMode = .never
        textField.leftViewMode = .never
        textField.leftView = nil
        textField.rightViewMode = .always
        textField.rightView = self.searchImageView
        return textField
        }()
    
    private func setupSubViews() {
        addSubview(searchBar)
        searchBar.addSubview(searchBarTextField)
        searchBarTextField.addSubview(searchImageView)
    }
    
    private func setupAutoLayout() {
//        searchBar.anchor(top: safeAreaLayoutGuide.topAnchor, bottom: nil,         leading: safeAreaLayoutGuide.leadingAnchor, trailing: safeAreaLayoutGuide.trailingAnchor,
//                         centerX: nil, centerY: nil,
//                         centerXconstant: nil, centerYconstant: nil,
//                         size: CGSize.zero, padding: UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0))
        
//        searchImageView.setSize(size: CGSize(width: 16, height: 16))
    }
}
