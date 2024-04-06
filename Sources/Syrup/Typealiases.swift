//
//  Typealiases.swift
//  Syrup
//
//  Created by Sarfraz Basha on 1/4/2024.
//

import Foundation

public typealias Completion = (() -> Void)
public typealias Handler<T> = ((T) -> Void)
public typealias Handler_<T, V> = ((T) -> V)
