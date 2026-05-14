//
//  Exports.swift
//  Syrup
//
//  Re-exports sibling targets so `import Syrup` transparently exposes
//  types that live in their own focused modules. Narrow consumers can
//  still `import Expires` directly.
//

@_exported import Expires
