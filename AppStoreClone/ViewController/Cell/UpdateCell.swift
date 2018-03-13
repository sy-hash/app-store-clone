//
//  UpdateCell.swift
//  AppStoreClone
//
//  Created by s-hashimoto on 2018/03/11.
//  Copyright © 2018年 sy-hash. All rights reserved.
//

import UIKit

class UpdateCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var versionTextLabel: UILabel!
    
    @IBOutlet weak var appTitleLabel: UILabel!
    
    @IBOutlet weak var appDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(item: UpdateAppRowItem) {
        iconImageView.image = UIImage(named: item.imageFileName)
        versionTextLabel.text = item.version
        appTitleLabel.text = item.title
        appDescriptionLabel.text = item.description
    }
    
}
