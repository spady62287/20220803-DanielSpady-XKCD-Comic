//
//  CurrentComicRequest.swift
//  20220803-DanielSpady-XKCD-Comic
//
//  Created by Daniel Spady on 2022-08-03.
//

import Foundation

class CurrentComicRequest: BaseRequest {
    
    override var url: URL? {
        let urlString = BaseService.currentComicEndpoint
        return URL(string: urlString)
    }
}
