//
//  AppDelegate.swift
//  Coursera
//
//  Created by okerivy on 15/9/29.
//  Copyright © 2015年 okerivy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor = UIColor.redColor()
        window?.rootViewController = MainViewController()
        
        window?.makeKeyAndVisible()
        return true
    }

 
}

