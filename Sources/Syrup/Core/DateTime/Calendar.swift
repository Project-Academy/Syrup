//
//  Calendar.swift
//  Syrup
//
//  Created by Sarfraz Basha on 16/3/2026.
//

import Foundation

extension Calendar {
    func dateRangeForWeek(containing date: Date = .now, inTimeZone tz: TimeZone? = .current) -> ClosedRange<Date>? {
        var cal = Calendar(identifier: .iso8601)
        if let tz { cal.timeZone = tz }
        cal.firstWeekday = 2  // Monday = 2
        
        // 1. Find the start of the week (Monday 00:00) in that time zone
        let components = cal.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date)
        guard let startOfWeek = cal.date(from: components)
        else { return nil }
        
        // 2. Define end: advance 1 week from the startOfWeek, then subtract 1 second
        guard let nextWeekStart = cal.date(byAdding: .weekOfYear, value: 1, to: startOfWeek),
              let endOfWeek = cal.date(byAdding: .second, value: -1, to: nextWeekStart)
        else { return nil }
        
        return startOfWeek...endOfWeek
    }
}

