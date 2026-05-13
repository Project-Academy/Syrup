//
//  PrefsOptions.swift
//  Syrup
//

import Foundation

/**
 Configuration for how a `@Prefs` property handles decoding failures.
 */
public struct PrefsOptions {

    public typealias DecodingFailureHandler = (_ key: String, _ rawValue: Any) -> Void
    public typealias EncodingFailureHandler = (_ key: String, _ value: Any) -> Void

    public enum StaleData {
        case keep
        case remove
    }

    public let staleData: StaleData
    public let onDecodingFailure: DecodingFailureHandler?
    public let onEncodingFailure: EncodingFailureHandler?

    public init(staleData: StaleData = .keep,
                onDecodingFailure: DecodingFailureHandler? = nil,
                onEncodingFailure: EncodingFailureHandler? = nil) {
        self.staleData = staleData
        self.onDecodingFailure = onDecodingFailure
        self.onEncodingFailure = onEncodingFailure
    }
}
