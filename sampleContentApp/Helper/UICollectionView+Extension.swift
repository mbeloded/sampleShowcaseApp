//
//  UICollectionView+Extension.swift
//  sampleContentApp
//
//  Created by Michael Bielodied on 2/17/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import UIKit

// MARK: - UICollectionViewCell
extension UICollectionViewCell {
    class var identifierCell: String {
        return String(describing: self)
    }
    
    class var nibCell: UINib {
        return UINib(nibName: identifierCell, bundle: nil)
    }
}
