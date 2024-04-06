//
//  Ext-UIColor.swift
//  Syrup
//
//  Created by Sarfraz Basha on 26/3/2024.
//

import UIKit


public extension UIColor {
    static var systemRandom: UIColor? {
        [UIColor.systemBlue, .systemBrown, .systemCyan,
         .systemGreen, .systemIndigo, .systemMint,
         .systemOrange, .systemPink, .systemPurple,
         .systemRed, .systemTeal, .systemYellow
        ].randomElement()
    }
    
    static var Random: UIColor {
        return UIColor(
            red:    .random(in: 0...1),
            green:  .random(in: 0...1),
            blue:   .random(in: 0...1),
            alpha:  1.0
        )
    }
}
public extension UIColor {
    
    /// Expected parameter is an array with hex strings - first for light, and last for dark.
    static func from(_ array: Any?) -> UIColor {
        guard let array = array as? Array<String>,
              array.count >= 1,
              let light = array.first,
              let dark = array.last // = light if only 1 elem.
        else { return .systemRed }
        return UIColor {
            $0.userInterfaceStyle == .light
            ? (UIColor(from: light) ?? .systemBlue)
            : (UIColor(from: dark) ?? .systemBlue)
        }
    }
    
    convenience init?(from hex: String?) {
        guard let hex, hex.count > 0 else { return nil }
        let hexa = hex.hasPrefix("#")
        ? hex.dropFirst()
        : hex[...]
        let chars = Array(hexa)
        let r = String(chars[0...1])
        let g = String(chars[2...3])
        let b = String(chars[4...5])
        let a = chars.count == 8 ? String(chars[6...7]) : "100"
        self.init(
            red:    .init(strtoul(r, nil, 16)) / 255,
            green:  .init(strtoul(g, nil, 16)) / 255,
            blue:   .init(strtoul(b, nil, 16)) / 255,
            alpha:  .init(strtoul(a, nil, 10)) / 100
        )
    }
}
