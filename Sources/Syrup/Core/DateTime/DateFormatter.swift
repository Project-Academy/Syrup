//
//  DateFormatter.swift
//  Syrup
//
//  Created by Sarfraz Basha on 26/3/2024.
//

import Foundation

public extension DateFormatter {
    
    /// Fixed-format dates need a fixed locale. Without `en_US_POSIX` the
    /// user's locale can override the calendar and the 12/24-hour setting, so
    /// the same `dateFormat` renders differently on two devices — Apple's own
    /// guidance (QA1480), and the shape of every "wrong time on one iPad" bug.
    convenience init(_ format: String) {
        self.init()
        self.dateFormat = format
        self.locale = Locale(identifier: "en_US_POSIX")
    }
    
    
}
