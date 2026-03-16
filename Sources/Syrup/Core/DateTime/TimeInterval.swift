//
//  TimeInterval.swift
//  Syrup
//
//  Created by Sarfraz Basha on 16/3/2026.
//

import Foundation

public extension TimeInterval {
    
    static func seconds(_ number: Int) -> Self {
        Double(number)
    }
    
    static func minutes(_ number: Int) -> Self {
        .seconds(60) * Double(number)
    }
    
}

