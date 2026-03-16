//
//  DateFormatter.swift
//  Syrup
//
//  Created by Sarfraz Basha on 26/3/2024.
//

import Foundation

public extension DateFormatter {
    
    convenience init(_ format: String) {
        self.init()
        self.dateFormat = format
    }
    
    
}
