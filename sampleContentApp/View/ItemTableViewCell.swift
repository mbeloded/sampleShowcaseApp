//
//  ItemTableViewCell.swift
//  sampleContentApp
//
//  Created by Michael Bielodied on 2/16/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    //MARK : variables
    fileprivate let placeholderImage = UIImage(named: "ic_no_photo")
    
    var viewModel: ItemViewModel? {
        didSet {
            if let viewModel = viewModel {
                titleLabel.text = viewModel.title
                sizeLabel.text = viewModel.sizeLabel
                brandLabel.text = viewModel.brand
                priceLabel.text = viewModel.price
                
                if !viewModel.price.isEmpty {
                    let originPriceAttributeString =  NSMutableAttributedString(string: viewModel.originalPrice)
                    originPriceAttributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, originPriceAttributeString.length))
                    originalPriceLabel?.attributedText = originPriceAttributeString
                } else {
                    originalPriceLabel.text = viewModel.originalPrice
                }
                
                if let favCnt = viewModel.favoriteCnt {
                    let favString = "\(favCnt)"
                    scoreLabel.text = favString
                } else {
                    favIcon.isHidden = true
                    scoreLabel.text = ""
                }
                if let tumbUrl = viewModel.thumbUrl {
                    thumbnailImageView.download(from: tumbUrl, placeholder: placeholderImage)
                }
            }
        }
    }
    
    //MARK: outlets
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var sizeLabel: UILabel!
    
    @IBOutlet weak var brandLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var originalPriceLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var bgView: UIView! {
        didSet {
            //setup the border line
            bgView.layer.cornerRadius = 4
        }
    }
    @IBOutlet weak var favIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
