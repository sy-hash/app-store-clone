//
//  UpdateSectionHeaderView.swift
//  AppStoreClone
//
//  Created by s-hashimoto on 2018/03/14.
//  Copyright © 2018年 sy-hash. All rights reserved.
//

import UIKit

class UpdateSectionHeaderView: UIView {
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "保留中"
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let stackView = UIStackView(arrangedSubviews: [label])
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10.0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10.0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
