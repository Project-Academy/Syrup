//
//  UIColor.swift
//  Syrup
//
//  Created by Sarfraz Basha on 27/11/2025.
//

import UIKit

public extension UIColor {
    
    //--------------------------------------
    // MARK: - COLOUR GENERATOR -
    //--------------------------------------
    static var random: UIColor {
        UIColor(
            red:    .random(in: 0...1),
            green:  .random(in: 0...1),
            blue:   .random(in: 0...1),
            alpha:  1
        )
    }
    
    //--------------------------------------
    // MARK: - HEX INITIALISERS -
    //--------------------------------------
    /// Hex Initialiser
    ///
    /// Can include the "#" or omit it.
    convenience init?(from hex: String?) {
        guard let hex, hex.count > 5 else { return nil }
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
    
    convenience init(_ hex: Int) {
        let r = CGFloat((hex >> 16) & 0xff) / 255
        let g = CGFloat((hex >> 8) & 0xff) / 255
        let b = CGFloat(hex & 0xff) / 255
        self.init(red: r, green: g, blue: b, alpha: 1)
    }
}
