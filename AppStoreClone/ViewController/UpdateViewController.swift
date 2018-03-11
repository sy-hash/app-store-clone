//
//  UpdateViewController.swift
//  AppStoreClone
//
//  Created by s-hashimoto on 2018/02/26.
//  Copyright © 2018年 sy-hash. All rights reserved.
//

import UIKit

class UpdateViewController: UITableViewController {

    var largeTitleBaseView: UIView?
    
    let button: UIButton = {
        let button = UIButton(type: .custom)
        let profileImage = R.image.profile()!.withRenderingMode(.alwaysOriginal)
        button.setImage(profileImage, for: UIControlState())
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(R.nib.updateCell(), forCellReuseIdentifier: "identifier")
        
        navigationItem.title = "アップデート"
        
        if let largeTitleBaseView = self.navigationController?.navigationBar.subviews[1] {
            largeTitleBaseView.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.trailingAnchor.constraint(equalTo: largeTitleBaseView.trailingAnchor, constant: -10).isActive = true
            button.bottomAnchor.constraint(equalTo: largeTitleBaseView.bottomAnchor, constant: -10).isActive = true
            button.widthAnchor.constraint(equalToConstant: 30).isActive = true
            button.heightAnchor.constraint(equalToConstant: 30).isActive = true
            self.largeTitleBaseView = largeTitleBaseView
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension UpdateViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44*3
    }
    
}
