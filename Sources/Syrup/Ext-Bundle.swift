//
//  Ext-Bundle.swift
//  Sidekick
//
//  Created by Sarfraz Basha on 26/3/2024.
//

import Foundation

public extension Bundle {
    subscript(_ key: String) -> Any? { self.object(forInfoDictionaryKey: key) }
}
