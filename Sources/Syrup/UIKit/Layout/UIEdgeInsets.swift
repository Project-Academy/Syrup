//
//  UIEdgeInsets.swift
//  Syrup
//
//  Created by Sarfraz Basha on 16/3/2026.
//

#if canImport(UIKit)
import UIKit

public extension NSDirectionalEdgeInsets {
    
    init(_ all: CGFloat) {
        self.init(top: all, leading: all, bottom: all, trailing: all)
    }
    
}
#endif
