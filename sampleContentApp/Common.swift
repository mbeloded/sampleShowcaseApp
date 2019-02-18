//
//  Common.swift
//  sampleContentApp
//
//  Created by Michael Bielodied on 2/16/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import Foundation

public class Common : NSObject
{
    static var photoUrlFormat = "" {
        didSet {
            photoUrlFormat = photoUrlFormat.replacingOccurrences(of: ":photo_id", with: "%@")
        }
    }
    
    struct Global{
        static let API_URL = "https://s3.amazonaws.com/tup/iOS/Interview/"
        static let API_ALL = "Sample_Content.json"
    }
    
    static var getItems: String {
        return Common.Global.API_URL + Common.Global.API_ALL
    }
    
    static var getLargeAsset: String {
        return Common.photoUrlFormat
    }
    
}
