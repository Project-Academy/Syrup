//
//  UICollectionView.swift
//  Syrup
//
//  Created by Sarfraz Basha on 5/12/2025.
//

import UIKit

public protocol CVDiffable {
    associatedtype Section: Hashable, Sendable
    associatedtype Item:    Hashable, Sendable
    
    typealias Snapshot      = PKSnapshot<Section, Item>
    typealias DataSource    = PKDataSource<Section, Item>
    
    var snap: Snapshot      { get set }
    var data: DataSource    { get set }
    func applySnapshot(animated: Bool)
}

public typealias PKSnapshot = NSDiffableDataSourceSnapshot
public typealias PKDataSource = UICollectionViewDiffableDataSource

public typealias CVDelegate = UICollectionViewDelegate & UICollectionViewDelegateFlowLayout

public typealias CellReg = UICollectionView.CellRegistration
public typealias SuppReg = UICollectionView.SupplementaryRegistration

@MainActor
public extension String {
    static var GlobalHeader: String { UICollectionView.elementKindGlobalHeader }
    static var SectionHeader: String { UICollectionView.elementKindSectionHeader }
}

@MainActor
extension CellReg {
    public func configuredCell(cv: UICollectionView, ip: IndexPath, item: Item) -> UICollectionViewCell? {
        cv.dequeueConfiguredReusableCell(using: self, for: ip, item: item)
    }
    public func cell(_ cv: UICollectionView, _ ip: IndexPath, _ item: Item) -> UICollectionViewCell? {
        cv.dequeueConfiguredReusableCell(using: self, for: ip, item: item)
    }
}
public extension UICollectionView {
    static let elementKindGlobalHeader: String = "GlobalHeader"
}

