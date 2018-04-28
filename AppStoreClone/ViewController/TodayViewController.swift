//
//  TodayViewController.swift
//  AppStoreClone
//
//  Created by s-hashimoto on 2018/03/11.
//  Copyright © 2018年 sy-hash. All rights reserved.
//

import UIKit

class TodayViewController: UITableViewController {

    init() {
        super.init(style: .grouped)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
        tableView.separatorColor = UIColor.clear
        tableView.register(R.nib.todayLargeAppCellTableViewCell(), forCellReuseIdentifier: "identifier")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension TodayViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let todayHeader = TodayAppHeaderView()
        return todayHeader
    }
}
