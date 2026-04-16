//
//  SemVer.swift
//  Syrup
//
//  Created by Sarfraz Basha on 16/4/2026.
//

public struct SemVer: Codable, Sendable, Equatable, Hashable {
    
    //--------------------------------------
    // MARK: - VARIABLES -
    //--------------------------------------
    public var major: Int
    public var minor: Int = 0
    public var patch: String = "0"
    
    //--------------------------------------
    // MARK: - INITIALISER -
    //--------------------------------------
    public init(_ string: String) {
        value = string
        let comps = value.components(separatedBy: ".")
        guard comps.count > 0,
              let _f = comps.first,
              let first = Int(_f)
        else {
            major = 0
            return
        }
        major = first
        if comps.count > 1, let second = Int(comps[1]) {
            minor = second
        }
        if comps.count == 3 {
            patch = comps[2]
        }
    }
    
    //--------------------------------------
    // MARK: - CODABLE -
    //--------------------------------------
    public private(set) var value: String
    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        value = try container.decode(String.self)
        let comps = value.components(separatedBy: ".")
        guard comps.count > 0,
              let _f = comps.first,
              let first = Int(_f)
        else {
            major = 0
            return
        }
        major = first
        if comps.count > 1, let second = Int(comps[1]) {
            minor = second
        }
        if comps.count == 3 {
            patch = comps[2]
        }
    }
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
    enum CodingKeys: CodingKey {
        case value
    }
    
}
extension SemVer: CustomStringConvertible {
    public var description: String { value }
}
extension SemVer: Comparable {
    public static func < (lhs: SemVer, rhs: SemVer) -> Bool {
        // First compare Majors
        guard lhs.major == rhs.major
        else { return lhs.major < rhs.major }
        
        // Then compare Minors
        guard lhs.minor == rhs.minor
        else { return lhs.minor < rhs.minor }
        
        // Then compare Patches
        return lhs.patch < rhs.patch
    }
}
