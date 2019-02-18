//
//  ItemDetailsViewModel.swift
//  sampleContentApp
//
//  Created by Michael Bielodied on 2/17/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import Foundation

final class ItemDetailsViewModel {
    
    weak var dataSource : GenericDataSource<String>?
    
    let title: String
    let itemDescription: String
    let photoUrls: [String]
    let sizeLabel: String
    
    let price: String
    let outOfRegionPrice: String
    let originalPrice: String
    let msrp: String
    
    let favoriteCnt: Int?
    
    var itemDetails: [DetailItemViewModel]
    
    init(_ item: Item, dataSource: GenericDataSource<String>?) {
        
        self.title = item.title
        
        self.dataSource = dataSource
        
        self.favoriteCnt = item.favoriteCnt
        self.sizeLabel = item.sizeLabel
        
        self.itemDescription = item.title + ", " + item.brand

        self.photoUrls = item.photoIds.map({ String(format: Common.getLargeAsset, $0)})
        self.dataSource?.data.value.append(contentsOf: self.photoUrls)
        
        //item details
        self.itemDetails = [DetailItemViewModel]()
        
        self.itemDetails.append(DetailItemViewModel(title: "gender", value: item.thredUpGender))
        
        for material in item.materials {
            self.itemDetails.append(DetailItemViewModel(title: "material", value: material))
        }
        
        for size in item.sizes {
            self.itemDetails.append(DetailItemViewModel(title: "size", value: size))
        }
        
        for colorName in item.colorNames {
            self.itemDetails.append(DetailItemViewModel(title: "color", value: colorName))
        }
        
        if let newWithTags = item.newWithTags {
            self.itemDetails.append(DetailItemViewModel(title: "with tags(new)", value: newWithTags ? "yes":"no"))
        }
        
        self.itemDetails.append(DetailItemViewModel(title: "quality code", value: item.qualityCode))
        
        //price info
        self.price = item.price ?? ""
        
        if let outOfPrice = item.outOfRegionPrice {
            self.outOfRegionPrice = "In your region: " + outOfPrice
        } else {
            self.outOfRegionPrice = ""
        }
        
        self.originalPrice = item.originalPrice
        self.msrp = item.msrp
        
    }
}
