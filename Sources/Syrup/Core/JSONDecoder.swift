//
//  JSONDecoder.swift
//  Syrup
//
//  Created by Sarfraz Basha on 26/4/2026.
//

import Foundation

extension JSONDecoder.DateDecodingStrategy {

    /// ISO8601 strategy that accepts both fractional-second and plain forms,
    /// e.g. `2026-04-26T10:30:00.123Z` or `2026-04-26T10:30:00Z`.
    public static let iso8601Flexible: Self = .custom { decoder in
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let date = iso8601Fractional.date(from: string) { return date }
        if let date = iso8601Plain.date(from: string) { return date }
        throw DecodingError.dataCorruptedError(
            in: container,
            debugDescription: "Invalid ISO8601 date: \(string)"
        )
    }
}

nonisolated(unsafe) private let iso8601Fractional: ISO8601DateFormatter = {
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
    return formatter
}()

nonisolated(unsafe) private let iso8601Plain: ISO8601DateFormatter = {
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = [.withInternetDateTime]
    return formatter
}()
