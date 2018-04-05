//
//  VisualEffectView.swift
//  DynamicBlurViewDemo
//
//  Created by Sun,Shuyao on 2018/4/4.
//  Copyright © 2018年 Sun,Shuyao. All rights reserved.
//

import UIKit

class VisualEffectView: UIView {
    var blurEffect: UIBlurEffect?
    var effectView: UIVisualEffectView?
    
    init(frame: CGRect, style: UIBlurEffectStyle) {
        super.init(frame: frame)
        blurEffect = UIBlurEffect(style: style)
        effectView = UIVisualEffectView(effect: blurEffect)
        effectView?.frame = self.bounds
        if let effectView = effectView {
            self.addSubview(effectView)
        }
    }

    

    func goOnAnimation() {
        UIView.animate(withDuration: 1) {
            self.effectView?.effect = self.effectView?.effect == nil ? self.blurEffect : nil
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
