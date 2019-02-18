//
//  ItemDetailsView.swift
//  sampleContentApp
//
//  Created by Michael Bielodied on 2/17/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import UIKit

class ItemDetailsView: UIView {
    
    //MARK: variables
    fileprivate let margin = CGFloat(0)
    var viewModel: DetailItemViewModel? {
        didSet {
            if let viewModel = viewModel {
                detailTitleLabel.text = viewModel.title
                detailValueLabel.text = viewModel.value
            }
        }
    }

    //MARK: outlets
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailValueLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupUI()
        
    }
    
    fileprivate func setupUI() {
        Bundle.main.loadNibNamed("ItemDetailsView", owner: self, options: nil)
        self.addSubview(self.view);    // adding the top level view to the view hierarchy
        
        self.view.translatesAutoresizingMaskIntoConstraints = false   // 5
        self.view.layoutAttachAll(margin: margin)   // 6
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
