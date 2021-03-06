//
//  ReusableCell.swift
//  GenericDataSource
//
//  Created by Mohamed Afifi on 4/11/16.
//  Copyright © 2016 mohamede1945. All rights reserved.
//

import Foundation

/**
 Represents the reusable cell protocol for all resuable cells mainliy `UITableViewCell` and `UICollectionViewCell`.
 This protocol is used to limit the use of the `BasicDataSource` generic type `CellType` to only for `UITableViewCell` and `UICollectionViewCell`.
 */
@objc public protocol ReusableCell {
}

/// Make `UITableViewCell` reusable cell.
extension UITableViewCell : ReusableCell {
}

/// Make `UICollectionViewCell` reusable cell.
extension UICollectionViewCell : ReusableCell {
}
