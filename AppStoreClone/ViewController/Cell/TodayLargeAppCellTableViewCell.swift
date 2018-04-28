//
//  TodayLargeAppCellTableViewCell.swift
//  AppStoreClone
//
//  Created by s-hashimoto on 2018/04/28.
//  Copyright © 2018年 sy-hash. All rights reserved.
//

import UIKit

class TodayLargeAppCellTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
    }
    
    private func initView() {
        backgroundColor = UIColor.clear
        mainImageView.layer.cornerRadius = 10.0
        mainImageView.layer.shadowRadius = 5.0
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
