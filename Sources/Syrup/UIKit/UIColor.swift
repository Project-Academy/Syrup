//
//  UIColor.swift
//  Syrup
//
//  Created by Sarfraz Basha on 27/11/2025.
//

import UIKit

public extension UIColor {
    static var random: UIColor {
        UIColor(
            red:    .random(in: 0...1),
            green:  .random(in: 0...1),
            blue:   .random(in: 0...1),
            alpha:  1
        )
    }
}
