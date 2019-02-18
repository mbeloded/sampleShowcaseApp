//
//  Item.swift
//  sampleContentApp
//
//  Created by Michael Bielodied on 2/16/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import Foundation

struct Item: Decodable {
    let id: Int
    let title: String
    let brand: String
    let photoIds: [String]
    let materials: [String]
    let sizeLabel:  String
    let sizes: [String]
    let colorNames: [String]
    let outOfRegionPrice: String?
    let originalPrice: String
    let msrp: String
    let price: String?
    let favoriteCnt: Int?
    let thredUpGender: String
    let newWithTags: Bool?
    let qualityCode: String
    
    enum CodingKeys: String, CodingKey { //mapping the keys here
        case id, title, brand, materials, sizes, price, msrp, photoIds = "photo_ids", colorNames = "color_names", originalPrice = "original_price", outOfRegionPrice = "out_of_region_price", favoriteCnt = "favorite_count", sizeLabel = "size_label", thredUpGender = "thredup_gender", newWithTags = "new_with_tags", qualityCode = "quality_code"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.brand = try container.decode(String.self, forKey: .brand)
        self.photoIds = try container.decode([String].self, forKey: .photoIds)
        self.materials = try container.decode([String].self, forKey: .materials)
        self.sizes = try container.decode([String].self, forKey: .sizes)
        self.sizeLabel = try container.decode(String.self, forKey: .sizeLabel)
        self.colorNames = try container.decode([String].self, forKey: .colorNames)
        self.msrp = try container.decode(String.self, forKey: .msrp)
        self.outOfRegionPrice = try container.decodeIfPresent(String.self, forKey: .outOfRegionPrice)
        self.originalPrice = try container.decode(String.self, forKey: .originalPrice)
        self.price = try container.decodeIfPresent(String.self, forKey: .price)
        self.favoriteCnt = try container.decodeIfPresent(Int.self, forKey: .favoriteCnt)
        self.thredUpGender = try container.decode(String.self, forKey: .thredUpGender)
        self.newWithTags = try container.decodeIfPresent(Bool.self, forKey: .newWithTags)
        self.qualityCode = try container.decode(String.self, forKey: .qualityCode)
    }
}
