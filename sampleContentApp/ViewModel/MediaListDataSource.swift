//
//  PhotoListDataSource.swift
//  sampleContentApp
//
//  Created by Michael Bielodied on 2/17/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import UIKit

class MediaListDataSource : GenericDataSource<String>, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemMediaCollectionViewCell.identifierCell, for: indexPath) as! ItemMediaCollectionViewCell
        cell.mediaUrl = data.value[indexPath.row]
        
        return cell
    }
 
}
