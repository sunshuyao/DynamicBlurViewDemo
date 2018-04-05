//
//  GLBlurVC.swift
//  DynamicBlurViewDemo
//
//  Created by Sun,Shuyao on 2018/4/5.
//  Copyright © 2018年 Sun,Shuyao. All rights reserved.
//

import UIKit

class GLBlurViewController: UIViewController {
    var backGroundImageView: UIImageView?
    var blurView: GLBlurView?
    var slider: UISlider?
    override func viewDidLoad() {
        super.viewDidLoad()

        backGroundImageView = UIImageView(image: #imageLiteral(resourceName: "home"))
        backGroundImageView?.contentMode = .scaleAspectFill
        backGroundImageView?.frame = self.view.bounds
        if let backGroundImageView = backGroundImageView {
            self.view.addSubview(backGroundImageView)
        }
        
        blurView = GLBlurView(frame: self.view.bounds)
        blurView?.addTo(superView: self.view)

        slider = UISlider(frame: CGRect(x: 0, y: self.view.bounds.height*8/10, width: self.view.bounds.width, height: 50))
        slider?.addTarget(self, action: #selector(handleSlider(slider:)), for: .valueChanged)
        slider?.minimumValue = 0
        slider?.maximumValue = 100
        if let slider = slider {
            self.view.addSubview(slider)
        }
    }
    @objc func handleSlider(slider: UISlider) {
        blurView?.blurRadius = slider.value
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
