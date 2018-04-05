//
//  GLBlurView.swift
//  DynamicBlurViewDemo
//
//  Created by Sun,Shuyao on 2018/4/5.
//  Copyright © 2018年 Sun,Shuyao. All rights reserved.
//

import UIKit
import GLKit
class GLBlurView: GLKView {
    let clampFilter = CIFilter(name: "CIAffineClamp")!
    let blurFilter = CIFilter(name: "CIGaussianBlur")!
    let ciContext:CIContext
    var inputCIImage: CIImage? {
        didSet {
            setNeedsDisplay()
        }
    }
    var inputImage: UIImage? {
        didSet {
            inputCIImage = inputImage.map { CIImage(image: $0)! }
        }
    }
    var blurRadius: Float = 0 {
        didSet {
            blurFilter.setValue(blurRadius, forKey: "inputRadius")
            setNeedsDisplay()
        }
    }
    override init(frame: CGRect) {
        let glContext = EAGLContext(api: .openGLES3)
        ciContext = CIContext(
            eaglContext: glContext!,
            options: [
                kCIContextWorkingColorSpace: NSNull()
            ]
        )
        super.init(frame: frame, context: glContext!)
        enableSetNeedsDisplay = true
    }
    func addTo(superView: UIView) {
        UIGraphicsBeginImageContextWithOptions(superView.frame.size, false, 0)
        if let context = UIGraphicsGetCurrentContext() {
            superView.layer.render(in: context)
        }
        inputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        superView.addSubview(self)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        if let inputCIImage = inputCIImage {
            clampFilter.setValue(inputCIImage, forKey: kCIInputImageKey)
            blurFilter.setValue(clampFilter.outputImage!, forKey: kCIInputImageKey)
            let rect = CGRect(x: 0, y: 0, width: drawableWidth, height: drawableHeight)
            ciContext.draw(blurFilter.outputImage!, in: rect, from: inputCIImage.extent)
        }
    }
    public func getImageWith(blur: CGFloat) -> UIImage? {
        if let inputCIImage = inputCIImage {
            clampFilter.setValue(inputCIImage, forKey: kCIInputImageKey)
            blurFilter.setValue(blur, forKey: "inputRadius")
            blurFilter.setValue(clampFilter.outputImage!, forKey: kCIInputImageKey)
            if let result = blurFilter.value(forKey: kCIOutputImageKey) as? CIImage {
                if let outImage = ciContext.createCGImage(result, from: inputCIImage.extent) {
                    return UIImage(cgImage: outImage)
                }
            }
        }
        return nil
    }
}
