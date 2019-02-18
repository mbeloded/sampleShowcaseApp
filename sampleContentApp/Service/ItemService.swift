//
//  ItemService.swift
//  sampleContentApp
//
//  Created by Michael Bielodied on 2/16/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import Foundation

protocol ItemServiceProtocol : class {
    func fetchItems(completion: @escaping ((Result<ItemsList, ErrorResult>) -> Void))
}

final class ItemService : RequestHandler, ItemServiceProtocol {
    
    static let shared = ItemService()
    
    func fetchItems(completion: @escaping ((Result<ItemsList, ErrorResult>) -> Void)) {
        
        let url = String(format: Common.getItems)
        
        APIService.init().get(urlString: url,
                              completion: self.networkResult(completion: completion))
    }
}
