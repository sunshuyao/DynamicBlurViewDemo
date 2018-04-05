//
//  ViewController.swift
//  DynamicBlurViewDemo
//
//  Created by Sun,Shuyao on 2018/4/4.
//  Copyright © 2018年 Sun,Shuyao. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let visualEffectVC = VisualEffectViewController()
        let visualEffectNC = UINavigationController(rootViewController: visualEffectVC)
        let barItem1 = UITabBarItem(title: "VisualEffect", image: #imageLiteral(resourceName: "bar"), tag: 0)
        visualEffectNC.tabBarItem = barItem1
        
        let vImageBlurVC = VImageBlurViewController()
        let vImageBlurNC = UINavigationController(rootViewController: vImageBlurVC)
        let barItem2 = UITabBarItem(title: "VImage", image: #imageLiteral(resourceName: "bar"), tag: 1)
        vImageBlurNC.tabBarItem = barItem2

        let glBlurVC = GLBlurViewController()
        let glBlurNC = UINavigationController(rootViewController: glBlurVC)
        let barItem3 = UITabBarItem(title: "GLBlur", image: #imageLiteral(resourceName: "bar"), tag: 2)
        glBlurNC.tabBarItem = barItem3
        
        let controllers = [visualEffectNC, vImageBlurNC, glBlurNC]
        self.viewControllers = controllers
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

