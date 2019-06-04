//
//  MJStringExtend.swift
//  XLDoctor
//
//  Created by longma on 2018/12/28.
//  Copyright © 2018年 XLH. All rights reserved.
//

import Foundation
import UIKit

//MARK: ********************************************************  转换
extension UIImage {
    
    /// color 转 UIImage
    ///
    /// - Parameter color: 颜色
    /// - Returns: UIImage
    class func mj_image(with color: UIColor?) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color!.cgColor)
        context?.fill(rect)
        let theImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return theImage
    }
    
    /// 修改图片颜色 （娄底图）
    ///
    /// - Parameter color: 填充色
    /// - Returns: UIImage
    func mj_imageChange(with color: UIColor?) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, _: false, _: scale)
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context!.setBlendMode(CGBlendMode.normal)
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        context?.clip(to: rect, mask: cgImage!)
        color?.setFill()
        context?.fill(rect)
        let newImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    /// 图片旋转 - 相机拍出的照片要旋转 90度
    ///
    /// - Returns: 旋转后的图片
    func mj_imageWithRightOrientation() -> UIImage? {
        let aImage: UIImage = self
        if aImage.imageOrientation == .up {
            return aImage
        }
        
        var transform: CGAffineTransform = .identity
        
        switch aImage.imageOrientation {
        case .down, .downMirrored:
            transform = transform.translatedBy(x: aImage.size.width, y: aImage.size.height)
            transform = transform.rotated(by: .pi)
        case .left, .leftMirrored:
            transform = transform.translatedBy(x: self.size.width, y: 0)
            transform = transform.rotated(by: .pi / 2)
        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: self.size.height)
            transform = transform.rotated(by: -.pi / 2)
        default:
            break
        }
        
        
        switch aImage.imageOrientation {
        case .upMirrored, .downMirrored:
            transform = transform.translatedBy(x: aImage.size.width, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        case .rightMirrored, .leftMirrored:
            transform = transform.translatedBy(x: aImage.size.height, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        default:
            break
        }

        let ctx = CGContext(data: nil, width: Int(self.size.width), height: Int(self.size.height), bitsPerComponent: self.cgImage!.bitsPerComponent, bytesPerRow: 0, space: self.cgImage!.colorSpace!, bitmapInfo: self.cgImage!.bitmapInfo.rawValue)
        
        ctx?.concatenate(transform)
        
        switch self.imageOrientation {
        case .left, .leftMirrored, .right, .rightMirrored:
            ctx?.draw(self.cgImage!, in: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(size.height), height: CGFloat(size.width)))
            break
            
        default:
            ctx?.draw(self.cgImage!, in: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(size.width), height: CGFloat(size.height)))
            break
        }
        
        let cgimg: CGImage = (ctx?.makeImage())!
        let img = UIImage(cgImage: cgimg)
        
        return img

        
    }
    
    /// 保存图片到相册
    func mj_imageSavedPhotosToAlbum(){
        PHPhotoLibrary.shared().performChanges({
            //写入图片到相册
            PHAssetChangeRequest.creationRequestForAsset(from: self)
            
        }, completionHandler: { success, error in
            if let error = error {
                print("success = \(success), error = \(error)")
            }
            MJProgressHUD.showSuccess(withStatus: "保存成功")
        })
    }
}






