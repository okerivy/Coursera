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
        
        // 先用 kvc 替换 tabbar
        let tb = MainTabBar()
        setValue(tb, forKeyPath: "tabBar")
        
        tb.composeButton.addTarget(self, action: "composeButtonClick", forControlEvents: UIControlEvents.TouchUpInside)
        
        addChildViewControllers()

    }
    
    ///  点击中间按钮 按钮点击方法必须公开
    func composeButtonClick() {
        print(__FUNCTION__)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print(tabBar.items)
    }

    /// 添加所有的子控制器
    private func addChildViewControllers() {
        
        //加载 json
        let path = NSBundle.mainBundle().pathForResource("MainVCSetting.json", ofType: nil)!
        let data = NSData(contentsOfFile: path)!
        // 反序列化
        do {
            let array = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
            
            // 在遍历数组的时候,必须指明数组中包含对象的类型,包括字典的格式
            for dict in array as! [[String: String]]{
                print(dict)
                addChildViewController(dict["vcName"]!, title: dict["title"]!, imageName: dict["imageName"]!)
            }
            
        } catch(_) {
            
        }
        
        
        
    }
    
    

  
    ///  添加子控制器
    ///
    ///  - parameter vc:        子控制器
    ///  - parameter title:     标题
    ///  - parameter imageName: 图片名称
    private func addChildViewController(vcName: String, title: String, imageName: String) {
        tabBar.tintColor = UIColor.orangeColor()
        
        // Swift 中的类名是包含命名空间的，如果希望用字符串动态创建并且实例化类，需要按照以下代码格式
        // Swift 设定对象的类型 写在右侧 as! String   as? String
        // 自动推导, 右侧指定好, 左侧变量类型自然 ok
        let ns = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        
        // 将字符串转成类
        let anyobjecType: AnyObject.Type = NSClassFromString(ns + "." + vcName)!
        if anyobjecType is UIViewController.Type {
            let vc = (anyobjecType as! UIViewController.Type).init()
            vc.title = title
            vc.tabBarItem.image = UIImage(named: imageName)
            vc.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
            let nav = UINavigationController(rootViewController: vc)
            addChildViewController(nav)
            print(vc)
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
