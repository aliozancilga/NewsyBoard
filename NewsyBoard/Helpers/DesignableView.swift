//
//  DesignableView.swift
//  NewsyBoard
//
//  Created by Macbook on 13.09.2018.
//  Copyright © 2018 Ali Ozan. All rights reserved.
//

import UIKit

@IBDesignable
class DisableImageView: UIView {
    
}

extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
