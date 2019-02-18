//
//  ItemViewModel.swift
//  sampleContentApp
//
//  Created by Michael Bielodied on 2/16/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import Foundation

struct ItemViewModel {
    let title: String
    let brand: String
    let thumbUrl: String?
    let sizeLabel: String
    let price: String
    let originalPrice: String
    let favoriteCnt: Int?
    
    init(_ item: Item) {
        title = item.title
        brand = item.brand
        thumbUrl = item.photoIds.first.map({String(format: Common.getLargeAsset, $0)})
        sizeLabel = item.sizeLabel
        price = item.price ?? ""
        originalPrice = item.originalPrice
        favoriteCnt = item.favoriteCnt
    }
}
