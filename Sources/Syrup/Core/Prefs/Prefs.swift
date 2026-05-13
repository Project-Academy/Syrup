//
//  Prefs.swift
//  Syrup
//

import Foundation

/**
 A property wrapper that persists values to `UserDefaults`, with automatic
 JSON encoding for types that aren't natively supported.

 Native types (`Bool`, `Int`, `Float`, `Double`, `String`, `Data`, `Date`) are
 stored directly. All other `Codable` types are JSON-encoded into `Data` before
 storage and decoded back on read.
 */
@propertyWrapper
public struct Prefs<Value: Codable> {

    private let defaultValue: Value
    private let storage: UserDefaults
    private let options: PrefsOptions?
    public let key: String

    public var wrappedValue: Value {
        get {
            guard let raw = storage.object(forKey: key)
            else { return defaultValue }

            if let value = raw as? Value { return value }
            if let data = raw as? Data,
               let decoded = try? JSONDecoder().decode(Value.self, from: data) {
                return decoded
            }

            options?.onDecodingFailure?(key, raw)
            if options?.staleData == .remove {
                storage.removeObject(forKey: key)
            }
            return defaultValue
        }
        set {
            if let optional = newValue as? AnyOptional, optional.isNil {
                storage.removeObject(forKey: key)
                return
            }
            switch newValue {
            case let v as Bool:   storage.set(v, forKey: key)
            case let v as Int:    storage.set(v, forKey: key)
            case let v as Float:  storage.set(v, forKey: key)
            case let v as Double: storage.set(v, forKey: key)
            case let v as String: storage.set(v, forKey: key)
            case let v as Data:   storage.set(v, forKey: key)
            case let v as Date:   storage.set(v, forKey: key)
            default:
                if let data = try? JSONEncoder().encode(newValue) {
                    storage.set(data, forKey: key)
                } else {
                    options?.onEncodingFailure?(key, newValue)
                }
            }
        }
    }

    public init(wrappedValue defaultValue: Value,
                _ key: String,
                _ options: PrefsOptions? = nil,
                storage: UserDefaults = .standard) {
        self.defaultValue = defaultValue
        self.key = key
        self.options = options
        self.storage = storage
    }
}

public extension Prefs where Value: ExpressibleByNilLiteral {
    init(_ key: String,
         _ options: PrefsOptions? = nil,
         storage: UserDefaults = .standard) {
        self.init(wrappedValue: nil, key, options, storage: storage)
    }
}

private protocol AnyOptional { var isNil: Bool { get } }
extension Optional: AnyOptional { var isNil: Bool { self == nil } }
