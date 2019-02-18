//
//  DetailsItemViewController.swift
//  sampleContentApp
//
//  Created by Michael Bielodied on 2/17/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    //MARK : variables
    var item: Item!
    
    lazy var viewModel : ItemDetailsViewModel = {
        let viewModel = ItemDetailsViewModel(item, dataSource: dataSource)
        return viewModel
    }()
    fileprivate var isAddedToFavourites = false //read def value from the item model
    private let dataSource = MediaListDataSource()
    
    //MARK: outlets
    @IBOutlet weak var photoCollection: UICollectionView! {
        didSet{
            
            photoCollection.dataSource = dataSource
            
            photoCollection.register(UINib(nibName: ItemMediaCollectionViewCell.identifierCell, bundle: nil), forCellWithReuseIdentifier: ItemMediaCollectionViewCell.identifierCell)
        }
    }
    
    @IBOutlet weak var pageControl: UIPageControl! {
        didSet {
            pageControl.currentPageIndicatorTintColor = .black
            pageControl.pageIndicatorTintColor = .gray
        }
    }
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var originPriceLabel: UILabel!
    @IBOutlet weak var regionPriceLabel: UILabel!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    
    @IBOutlet weak var itemDetailsStack: UIStackView!
    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var favLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        dataSource.data.addAndNotify(observer: self) { [weak self] in
            guard let self = self else {
                return
            }
            // 1
            self.photoCollection.reloadData()
        }
        
        self.setupView()
        
    }
    
    private func setupView() {
        
        title = viewModel.title
        
        priceLabel.text = viewModel.price
        
        if !viewModel.price.isEmpty {
            let originPriceAttributeString =  NSMutableAttributedString(string: viewModel.originalPrice)
            originPriceAttributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, originPriceAttributeString.length))
            originPriceLabel?.attributedText = originPriceAttributeString
        } else {
            originPriceLabel.text = viewModel.originalPrice
        }
        
        regionPriceLabel.text = viewModel.outOfRegionPrice
        itemDescriptionLabel.text = viewModel.itemDescription
        
        pageControl.numberOfPages = viewModel.photoUrls.count
        
        if let favCnt = viewModel.favoriteCnt {
            favLabel.text = "\(favCnt)"
        }
        
        for itemDetail in viewModel.itemDetails {
            
            let itemDetailsView = ItemDetailsView()
            
            itemDetailsView.viewModel = itemDetail
            itemDetailsStack.addArrangedSubview(itemDetailsView)
            
            itemDetailsStack.layoutIfNeeded()
        }
        
    }

    @IBAction func favAction(_ sender: Any) {
        AnimationsHelper.bounce(favBtn)
        
        if var favCnt = viewModel.favoriteCnt {
            
            if isAddedToFavourites {
                isAddedToFavourites = false
            } else {
                favCnt += 1
                isAddedToFavourites = true
            }
            
            favLabel.text = "\(favCnt)"
        }
        
    }
}
