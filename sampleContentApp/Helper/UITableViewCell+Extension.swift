//
//  UITableViewCell+Extension.swift
//  sampleContentApp
//
//  Created by Michael Bielodied on 2/16/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import UIKit

extension UITableViewCell {
    class var identifierCell: String {
        return String(describing: self)
    }
    
    class var nibCell: UINib {
        return UINib(nibName: identifierCell, bundle: nil)
    }
}
