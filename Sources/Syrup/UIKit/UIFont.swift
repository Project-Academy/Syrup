//
//  UIFont.swift
//  Syrup
//
//  Created by Sarfraz Basha on 26/11/2025.
//

import UIKit

public extension UIFont {
    
    //--------------------------------------
    // MARK: - SYSTEM FONTS -
    //--------------------------------------
    static var systemFont: UIFont { UIFont.systemFont(ofSize: UIFont.systemFontSize) }
    static func systemFont(_ size: CGFloat = UIFont.systemFontSize) -> UIFont { systemFont(ofSize: size) }
    
    static var mediumSystemFont: UIFont { .mediumSystemFont(UIFont.systemFontSize) }
    static func mediumSystemFont(_ size: CGFloat = UIFont.systemFontSize) -> UIFont { systemFont(ofSize: size, weight: .medium) }
    
    static var semiboldSystemFont: UIFont { .semiboldSystemFont(UIFont.systemFontSize) }
    static func semiboldSystemFont(_ size: CGFloat = UIFont.systemFontSize) -> UIFont { systemFont(ofSize: size, weight: .semibold) }
    
    static var boldSystemFont: UIFont { .boldSystemFont(UIFont.systemFontSize) }
    static func boldSystemFont(_ size: CGFloat = UIFont.systemFontSize) -> UIFont { systemFont(ofSize: size, weight: .bold) }
    
    static var heavySystemFont: UIFont { .heavySystemFont(UIFont.systemFontSize) }
    static func heavySystemFont(_ size: CGFloat = UIFont.systemFontSize) -> UIFont { systemFont(ofSize: size, weight: .heavy) }
    
    static var blackSystemFont: UIFont { .blackSystemFont(UIFont.systemFontSize) }
    static func blackSystemFont(_ size: CGFloat = UIFont.systemFontSize) -> UIFont { systemFont(ofSize: size, weight: .black) }
    
    //--------------------------------------
    // MARK: - SIZING -
    //--------------------------------------
    func upsize(by pts: CGFloat)    -> UIFont { withSize(pointSize + pts) }
    func downsize(by pts: CGFloat)  -> UIFont { withSize(pointSize - pts) }
    
    //--------------------------------------
    // MARK: - STYLING -
    //--------------------------------------
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
    
    //--------------------------------------
    // MARK: - HELPERS -
    //--------------------------------------
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


//--------------------------------------
// MARK: - HELPERS -
//--------------------------------------
private extension UIFont.Weight {
    static let allBolds: Array<UIFont.Weight> = [.medium, .semibold, .bold, .heavy, .black]
}
