//
//  Date.swift
//  Syrup
//
//  Created by Sarfraz Basha on 16/3/2026.
//

import Foundation

extension Date {
    
    func inFormat(_ format: String) -> String {
        let formatter = DateFormatter(format)
        return formatter.string(from: self)
    }
    
}


extension ClosedRange<Date> {
    
    /// A string representation of the range of dates
    ///
    /// > Returns:
    /// "`d` to `d MMM`" if the months of both bounds are the same, and "`d MMM` to `d MMM`" otherwise.
    ///
    /// > Example:
    /// "19 to 25 Jan" vs
    /// "26 Jan to 1 Feb"
    var asString: String {
        
        // If month is the same, don't include in lower.
        let lower = Calendar.current.compare(lowerBound, to: upperBound, toGranularity: .month) == .orderedSame
        ? lowerBound.inFormat("d")
        : lowerBound.inFormat("d MMM")
        let upper = upperBound.inFormat("d MMM")
        
        return "\(lower) to \(upper)"
    }
}
