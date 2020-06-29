//
//  UIImage+.swift
//  SimpleTableSample
//
//  Created by 佐藤遼平 on 2020/06/29.
//  Copyright © 2020 佐藤遼平. All rights reserved.
//

import Foundation
import UIKit
// UIImage Extension リサイズメソッド
// https://teratail.com/questions/31558 を参考にしつつ、警告が出る部分は警告にしたがって書き換え、
// 24 行目と 25 行目（UIGraphicsBegin... と draw(in: CGRect...) の行）は https://teratail.com/questions/185277 を参考にした

extension UIImage {

    func resize(size: CGSize) -> UIImage? {
        let widthRatio = size.width / self.size.width
        let heightRatio = size.height / self.size.height
        let ratio = (widthRatio < heightRatio) ? widthRatio : heightRatio
        let resizedSize = CGSize(width: (self.size.width * ratio), height: (self.size.height * ratio))
        // 画質を落とさないように以下を修正
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        draw(in: CGRect(x: (size.width - resizedSize.width) / 2, y: (size.height - resizedSize.height) / 2, width: resizedSize.width, height: resizedSize.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}
