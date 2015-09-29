//
//  MainViewController.swift
//  Coursera
//
//  Created by okerivy on 15/9/30.
//  Copyright © 2015年 okerivy. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewControllers()
        // Do any additional setup after loading the view.
    }

    /// 添加所有的子控制器
    private func addChildViewControllers() {
        
        addChildViewController(HomeTableViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(MessageTableViewController(), title: "消息", imageName: "tabbar_message_center")
        addChildViewController(DiscoverTableViewController(), title: "发现", imageName: "tabbar_discover")
        addChildViewController(ProfileTableViewController(), title: "我", imageName: "tabbar_profile")

        
    }
    
  
    ///  添加子控制器
    ///
    ///  - parameter vc:        子控制器
    ///  - parameter title:     标题
    ///  - parameter imageName: 图片名称
    private func addChildViewController(vc: UIViewController, title: String, imageName: String) {
        tabBar.tintColor = UIColor.orangeColor()
        
        vc.title = title
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        let nav = UINavigationController(rootViewController: vc)
        addChildViewController(nav)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
