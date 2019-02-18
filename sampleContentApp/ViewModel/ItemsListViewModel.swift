//
//  ItemsListViewModel.swift
//  sampleContentApp
//
//  Created by Michael Bielodied on 2/16/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import Foundation

final class ItemsListViewModel {
    weak var dataSource : GenericDataSource<Item>?
    weak var service: ItemServiceProtocol?
    
    private var isFetchInProgress = false
    
    init(service: ItemServiceProtocol = ItemService.shared, dataSource : GenericDataSource<Item>?) {
        self.dataSource = dataSource
        self.service = service
    }
    
    func fetchItems(_ completion: ((Result<Bool, ErrorResult>) -> Void)? = nil) {
        
        guard let service = service else {
            completion?(Result.failure(ErrorResult.custom(string: "Missing service")))
            return
        }
        
        guard !isFetchInProgress else {
            return
        }
        
        isFetchInProgress = true
        
        service.fetchItems(completion: { result in
            
            switch result {
            case .success(let response) :
                
                DispatchQueue.main.async {
                    
                    // 1
                    self.isFetchInProgress = false
                    
                    // 2
                    Common.photoUrlFormat = response.photoUrlFormat
                    // reload data
                    self.dataSource?.data.value.append(contentsOf: response.items)
                   
                    completion?(Result.success(true))
                    
                }
                break
            case .failure(let error) :
                
                DispatchQueue.main.async {
                    print("Parser error \(error)")
                    
                    self.isFetchInProgress = false
                    completion?(Result.failure(error))
                }
                break
            }
            
        })
    }
}
