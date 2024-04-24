//
//  Ext-Date.swift
//  Syrup
//
//  Created by Sarfraz Basha on 9/4/2024.
//

import Foundation

public extension Date {
    func inFormat(_ format: Format) -> String {
        DateFormatter(format).string(from: self)
    }
}

extension Date {
    public enum Format: String, Codable, Equatable {
        case activityLog = "yyyyMMdd.hhmmss"
        case shiftDate = "h:mm a, EEE d MMM"
    }
}

extension DateFormatter {
    public convenience init(_ format: Date.Format) {
        self.init()
        dateFormat = format.rawValue
    }
}
