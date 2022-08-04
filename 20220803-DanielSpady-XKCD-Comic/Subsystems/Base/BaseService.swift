//
//  BaseService.swift
//  20220803-DanielSpady-XKCD-Comic
//
//  Created by Daniel Spady on 2022-08-03.
//

import Foundation

class BaseService {
    /**
     JSON Endpoint
     https://xkcd.com/info.0.json
    */

    /**
     Current Comic endpoint.
     */
    static var currentComicEndpoint: String {
        guard let info = Bundle.main.infoDictionary else {
            return ""
        }
        
        guard let endpoint = info["XKCDCurrentComicURL"] as? String else {
            return ""
        }
        
        return endpoint
    }
}
