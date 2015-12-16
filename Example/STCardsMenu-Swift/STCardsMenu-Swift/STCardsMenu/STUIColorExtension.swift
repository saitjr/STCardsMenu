//
//  STUIColorExtension.swift
//  DeepBreathe
//
//  Created by TangJR on 11/26/15.
//  Copyright © 2015 tangjr. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(st_hex: Int) {
        
        let red = ((CGFloat)((st_hex & 0xFF0000) >> 16)) / 255.0
        let green = ((CGFloat)((st_hex & 0xFF00) >> 8)) / 255.0
        let blue = ((CGFloat)(st_hex & 0xFF)) / 255.0

        self.init(red:red, green:green, blue:blue, alpha:1.0)
    }
}