//
//  Ext-UIView.swift
//  Syrup
//
//  Created by Sarfraz Basha on 28/3/2024.
//

import UIKit

public extension UIView {
    
    func addTo(_ view: UIView?) { view?.addSubview(self) }
    
    func corner(radius: CGFloat,
                curve: CornerCurve = .continuous,
                corners: CACornerMask = .all) {
        layer.cornerRadius = radius
        layer.cornerCurve = curve
        layer.maskedCorners = corners
    }
    
}

public typealias CornerCurve = CALayerCornerCurve
public typealias CornerMask = CACornerMask
public extension CACornerMask {
    static let all: CACornerMask = [
        .layerMinXMinYCorner,
        .layerMaxXMinYCorner,
        .layerMinXMaxYCorner,
        .layerMaxXMaxYCorner
    ]
    static let top: CACornerMask = [
        .layerMinXMinYCorner, .layerMaxXMinYCorner
    ]
    static let bot: CACornerMask = [
        .layerMaxXMaxYCorner, .layerMinXMaxYCorner
    ]
}


public extension UIView {
    
    static func crossDissolve(with view: UIView, duration: TimeInterval = 0.25, animations: @escaping Completion, completion: Handler<Bool>? = nil) {
        UIView.transition(with: view, duration: duration, options: .transitionCrossDissolve, animations: animations, completion: completion)
    }
    
}
