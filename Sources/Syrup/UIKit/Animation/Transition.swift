//
//  Transition.swift
//  Syrup
//
//  Created by Sarfraz Basha on 16/3/2026.
//

import UIKit

extension UIView {
    
    static func crossDissolve(with view: UIView, duration: TimeInterval, animations: (() -> Void)? = nil) {
        transition(with: view, duration: duration, options: .curveEaseInOut, animations: animations)
    }
    
}
