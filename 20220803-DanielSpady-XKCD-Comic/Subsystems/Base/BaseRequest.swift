//
//  BaseRequest.swift
//  20220803-DanielSpady-XKCD-Comic
//
//  Created by Daniel Spady on 2022-08-03.
//

import Foundation

class BaseRequest {
    
    var url: URL? {
        // NOTE: Implement this in subclasses
        return nil
    }

    var request: URLRequest? {
        if let url = url {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            return request
        }
        
        return nil
    }
    
    var getRequest: URLRequest? {
        return request
    }
    
    // implment POST,PUT if requireds
}
