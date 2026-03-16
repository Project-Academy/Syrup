//
//  NSLayoutConstraint.swift
//  Syrup
//
//  Created by Sarfraz Basha on 8/12/2025.
//

import UIKit

public extension NSLayoutConstraint {
    
    func priority(_ prio: UILayoutPriority) -> Self {
        self.priority = prio
        return self
    }
    
}
