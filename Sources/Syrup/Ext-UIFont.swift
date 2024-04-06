//
//  Ext-UIFont.swift
//  Syrup
//
//  Created by Sarfraz Basha on 4/4/2024.
//

import UIKit


public extension UIFont {
    
    static var systemFont:          UIFont { .systemFont(ofSize: .systemFontSize) }
    static var Heading:             UIFont {
        .systemFont(ofSize: 44, weight: .black)
    }
    static var semiboldSystemFont:  UIFont { .systemFont(ofSize: .systemFontSize, weight: .semibold) }
    static var boldSystemFont:      UIFont { .systemFont(ofSize: .systemFontSize, weight: .bold) }
    
    static func systemFont(_ size: CGFloat = .systemFontSize) -> UIFont { systemFont(ofSize: size) }
    static func semiboldSystemFont(_ size: CGFloat = .systemFontSize) -> UIFont { systemFont(ofSize: size, weight: .semibold) }
    static func boldSystemFont(_ size: CGFloat = .systemFontSize) -> UIFont { systemFont(ofSize: size, weight: .bold) }
    static func blackSystemFont(_ size: CGFloat = .systemFontSize) -> UIFont { systemFont(ofSize: size, weight: .black) }
    func upsize(by pts: CGFloat)    -> UIFont { withSize(pointSize + pts) }
    func downsize(by pts: CGFloat)  -> UIFont { withSize(pointSize - pts) }
    
    var rounded: UIFont {
        guard let desc = self.fontDescriptor.withDesign(.rounded)
        else { return self }
        return UIFont(descriptor: desc, size: self.pointSize)
    }
    var italic: UIFont {
        var newTraits: UIFontDescriptor.SymbolicTraits = .traitItalic
        if UIFont.Weight.allBolds.contains(weight) { newTraits.insert(.traitBold) }
        guard let descriptor = fontDescriptor
            .withSymbolicTraits(newTraits)
        else { return self }
        return UIFont(descriptor: descriptor, size: pointSize)
    }
    
    private var weight: UIFont.Weight {
        guard let weightNumber = traits[.weight] as? NSNumber
        else { return .regular }
        let weightRawValue = CGFloat(weightNumber.doubleValue)
        let weight = UIFont.Weight(rawValue: weightRawValue)
        return weight
    }
    
    private var traits: [UIFontDescriptor.TraitKey: Any] {
        fontDescriptor.object(forKey: .traits) as? [UIFontDescriptor.TraitKey: Any] ?? [:]
    }
}

public extension CGFloat {
    
    static let systemFontSize: CGFloat = {
    #if os(tvOS)
        return 20
    #else
        return UIFont.systemFontSize
    #endif
        
    }()
}

private extension UIFont.Weight {
    static let allBolds: Array<UIFont.Weight> = [.medium, .semibold, .bold, .heavy, .black]
}
