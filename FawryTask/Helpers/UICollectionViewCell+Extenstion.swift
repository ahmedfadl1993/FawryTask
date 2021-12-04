//
//  UICollectionViewCell+Extenstion.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//

import UIKit

extension UICollectionViewCell {
    
    @objc  class func identifier() -> String {
        return description().components(separatedBy: ".").last!
    }
    
}
