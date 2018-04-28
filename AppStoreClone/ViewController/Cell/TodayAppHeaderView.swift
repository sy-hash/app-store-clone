//
//  TodayAppHeaderView.swift
//  AppStoreClone
//
//  Created by s-hashimoto on 2018/04/28.
//  Copyright © 2018年 sy-hash. All rights reserved.
//

import UIKit

class TodayAppHeaderView: UIView {
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 33)
        return label
    }()
    
    let profileButton: UIButton = {
        let button = UIButton(type: .custom)
        let profileImage = R.image.profile()!.withRenderingMode(.alwaysOriginal)
        button.setImage(profileImage, for: UIControlState())
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        dateLabel.text = "4月28日 土曜日"
        mainLabel.text = "Today"
        
        let innerStackView = UIStackView(arrangedSubviews: [dateLabel, mainLabel])
        innerStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [innerStackView, profileButton])
        profileButton.anchor.size.constraintEqual(equalTo: CGSize(width: 43, height: 43))
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        
        addSubview(stackView)
        stackView.anchor.edge.equalToSuperview(insets: UIEdgeInsets(top: 15, left: 15, bottom: 5, right: 15))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
