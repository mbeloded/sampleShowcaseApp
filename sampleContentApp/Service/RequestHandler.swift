//
//  RequestHandler.swift
//  sampleContentApp
//
//  Created by Michael Bielodied on 2/16/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import Foundation

class RequestHandler {
    
    func networkResult<T: Decodable>(completion: @escaping ((Result<T, ErrorResult>) -> Void)) ->
        ((Result<Data, ErrorResult>) -> Void) {
            
            return { dataResult in
                
                DispatchQueue.global(qos: .background).async(execute: {
                    switch dataResult {
                    case .success(let data) :
                        ParserHelper.parse(data: data, completion: completion)
                        break
                    case .failure(let error) :
                        print("Network error \(error)")
                        completion(.failure(.network(string: "Network error " + error.localizedDescription)))
                        break
                    }
                })
                
            }
    }
}
