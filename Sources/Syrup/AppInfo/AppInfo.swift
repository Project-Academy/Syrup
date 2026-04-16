//
//  Info.swift
//  Syrup
//
//  Created by Sarfraz Basha on 16/4/2026.
//

import Foundation

public struct AppInfo {
    
    private static var plist: Dictionary<String, Any> {
        Bundle.main.infoDictionary ?? [:]
    }
    public static var display: String? {
        plist[Key.Display] as? String
    }
    public static var appName: String {
        if let display { return display }
        let nameKey = kCFBundleNameKey as String
        return plist[nameKey] as! String
    }
    public static var version: SemVer {
        guard let ver = plist[Key.Version] as? String
        else { return SemVer("0.0.0") }
        return SemVer(ver)
    }
    public static var buildNo: String {
        let buildKey = kCFBundleVersionKey as String
        return plist[buildKey] as! String
    }
    
    //--------------------------------------
    // MARK: - SECRETS -
    //--------------------------------------
    public static var secrets: Dictionary<String, Any>? {
        plist[Key.Secrets] as? Dictionary<String, Any>
    }
    
}
//--------------------------------------
// MARK: - HELPERS -
//--------------------------------------
fileprivate extension AppInfo {
    enum Key: String {
        case Display = "CFBundleDisplayName"
        case Version = "CFBundleShortVersionString"
        case Secrets
    }
}
fileprivate extension Dictionary where Key == String, Value == Any {
    subscript (key: AppInfo.Key) -> Value? { self[key.rawValue] }
}
