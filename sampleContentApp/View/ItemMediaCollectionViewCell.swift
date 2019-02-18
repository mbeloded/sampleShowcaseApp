//
//  ItemMediaCollectionViewCell.swift
//  sampleContentApp
//
//  Created by Michael Bielodied on 2/17/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import UIKit

class ItemMediaCollectionViewCell: UICollectionViewCell {

    //MARK : variables
    fileprivate let placeholderImage = UIImage(named: "NoPhoto")
    
    var mediaUrl: String? {
        didSet {
            if let mediaUrl = mediaUrl {
                
                mediaThumbnail?.download(from: mediaUrl, placeholder: placeholderImage)

            }
        }
    }
    
    @IBOutlet weak var mediaThumbnail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
