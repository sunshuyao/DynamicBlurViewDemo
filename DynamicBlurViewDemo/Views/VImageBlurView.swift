//
//  VImageBlurView.swift
//  DynamicBlurViewDemo
//
//  Created by Sun,Shuyao on 2018/4/4.
//  Copyright © 2018年 Sun,Shuyao. All rights reserved.
//

import UIKit

class VImageBlurView: UIView {
    var snapshot: UIImage?
    var blurView: UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        blurView = UIImageView(frame: self.bounds)
        blurView?.contentMode = .scaleAspectFill
        if let blurView = blurView {
            self.addSubview(blurView)
        }
    }
    func addTo(superView: UIView) {
        UIGraphicsBeginImageContextWithOptions(superView.frame.size, false, 0) //Get snapshot
        if let context = UIGraphicsGetCurrentContext() {
            superView.layer.render(in: context)
        }
        snapshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if let snapshot = snapshot {
            if let data = UIImageJPEGRepresentation(snapshot, 0.5) { //In some case, the colur of image might be abnormal.
                let snapshotJPG = UIImage(data: data)
                self.snapshot = snapshotJPG
            }
            blurView?.image = snapshot
        }
        superView.addSubview(self)
    }
    func set(intensity: CGFloat) {
        blurView?.image = UIImage.boxblurImage(withBlur: intensity, oImg: snapshot)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
