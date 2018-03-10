//
//  AppRootViewController.swift
//  AppStoreClone
//
//  Created by s-hashimoto on 2018/03/11.
//  Copyright © 2018年 sy-hash. All rights reserved.
//

import UIKit

class AppRootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = TabBarController()
        addChildViewController(vc)
        vc.view.frame = view.bounds
        vc.view.autoresizingMask = view.autoresizingMask
        view.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
