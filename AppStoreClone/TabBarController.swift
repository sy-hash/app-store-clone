//
//  TabBarController.swift
//  AppStoreClone
//
//  Created by s-hashimoto on 2018/03/11.
//  Copyright © 2018年 sy-hash. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white

        let todayVC = TodayViewController()
        todayVC.tabBarItem = UITabBarItem(title: "Today", image: R.image.tab_icon_today(), tag: 0)
        
        let gameVC = GameViewController()
        gameVC.tabBarItem = UITabBarItem(title: "ゲーム", image: R.image.tab_icon_games(), tag: 0)
        
        let appVC = AppViewController()
        appVC.tabBarItem = UITabBarItem(title: "App", image: R.image.tab_icon_apps(), tag: 0)
        
        let updateVC = UpdateViewController()
        updateVC.tabBarItem = UITabBarItem(title: "アップデート", image: R.image.tab_icon_update(), tag: 0)
        
        let searchVC = SearchViewController()
        searchVC.tabBarItem = UITabBarItem(title: "検索", image: R.image.tab_icon_search(), tag: 0)
        
        let viewControllers = [todayVC, gameVC, appVC, updateVC, searchVC]
        setViewControllers(viewControllers, animated: false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
