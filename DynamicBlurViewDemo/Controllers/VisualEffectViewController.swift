//
//  VisualEffectViewController.swift
//  DynamicBlurViewDemo
//
//  Created by Sun,Shuyao on 2018/4/4.
//  Copyright © 2018年 Sun,Shuyao. All rights reserved.
//

import UIKit

class VisualEffectViewController: UIViewController {
    var backGroundImageView: UIImageView?
    var blurView: VisualEffectView?
    var startAnimatingBtn: UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backGroundImageView = UIImageView(image: #imageLiteral(resourceName: "home"))
        backGroundImageView?.contentMode = .scaleAspectFill
        backGroundImageView?.frame = self.view.bounds
        if let backGroundImageView = backGroundImageView {
            self.view.addSubview(backGroundImageView)
        }
        
        blurView = VisualEffectView(frame: self.view.bounds, style: .light)
        if let blurView = blurView {
            self.view.addSubview(blurView)
        }
        startAnimatingBtn = UIButton(type: .system)
        startAnimatingBtn?.frame = CGRect(x: 0, y: self.view.bounds.height*8/10, width: 100, height: 50)
        startAnimatingBtn?.setTitle("Dynamic Blur", for: .normal)
        startAnimatingBtn?.addTarget(self, action: #selector(handleClick), for: .touchUpInside)
        if let btn = startAnimatingBtn {
            self.view.addSubview(btn)
        }
    }

    @objc func handleClick() {
        blurView?.goOnAnimation()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
