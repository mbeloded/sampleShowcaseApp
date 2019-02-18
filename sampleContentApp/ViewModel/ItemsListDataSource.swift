//
//  ItemsListDataSource.swift
//  sampleContentApp
//
//  Created by Michael Bielodied on 2/16/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import UIKit

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

class ItemsListDataSource : GenericDataSource<Item>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifierCell, for: indexPath) as! ItemTableViewCell
        
        let storyItem = data.value[indexPath.row]
        cell.viewModel = ItemViewModel(storyItem)
        
        return cell
    }
}
