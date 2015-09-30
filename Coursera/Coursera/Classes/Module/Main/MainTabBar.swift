//
//  MainTabBar.swift
//  Coursera
//
//  Created by okerivy on 15/9/30.
//  Copyright © 2015年 okerivy. All rights reserved.
//

import UIKit

class MainTabBar: UITabBar {

    private let buttonCount = 5
    
    // layoutSubviews 不要写太耗时的操作
    // 当调整系统的布局时
    override func layoutSubviews() {
        super.layoutSubviews()
        print("------")
        print(composeButton)
        let w = bounds.width / CGFloat(buttonCount)
        let rect = CGRectMake(0, 0, w, bounds.height)
        
        // 遍历所有视图
        var index = 0
        for v in subviews {
            if v is UIControl  && !(v is UIButton) {

                v.frame = CGRectOffset(rect, CGFloat(index) * w, 0)
                index += index == 1 ? 2 :1

            }
        }
        composeButton.frame = CGRectOffset(rect, 2 * w, 0)
        
    }

    lazy var composeButton: UIButton = {
        let btn = UIButton(type: UIButtonType.Custom)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Normal)
        
        // self. 因为是闭包, 提前准备好的代码,在需要的时候执行,但是已经出了语境,所以用 self.
        self.addSubview(btn)
        return btn;
    }()
}
