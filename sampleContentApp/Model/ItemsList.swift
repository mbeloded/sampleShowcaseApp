//
//  ItemsList.swift
//  sampleContentApp
//
//  Created by Michael Bielodied on 2/16/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import Foundation

struct ItemsList: Decodable {
    let items: [Item]
    let photoUrlFormat: String
    
    enum CodingKeys: String, CodingKey { //fix the naming
        case items, photoUrlFormat = "photo_url_format"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Item].self, forKey: .items)
        self.photoUrlFormat = try container.decode(String.self, forKey: .photoUrlFormat)
        
    }
}
