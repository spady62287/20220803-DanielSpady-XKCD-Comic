//
//  CurrentComicResult.swift
//  20220803-DanielSpady-XKCD-Comic
//
//  Created by Daniel Spady on 2022-08-03.
//

import Foundation

struct CurrentComicResult: Codable {
    var month: String?
    var num: Int?
    var link: String?
    var year: String?
    var news: String?
    var safeTitle: String?
    var transcript: String?
    var alt: String?
    var img: String?
    var title: String?
    var day: String?
}

extension CurrentComicResult {
    enum CodingKeys: String, CodingKey {
        case month = "month"
        case num = "num"
        case link = "link"
        case year = "year"
        case news = "news"
        case safeTitle = "safe_title"
        case transcript = "transcript"
        case alt = "alt"
        case img = "img"
        case title = "title"
        case day = "day"
    }
}

/*
 // Example JSON Result Model
 {
     "month": "8",
     "num": 2654,
     "link": "",
     "year": "2022",
     "news": "",
     "safe_title": "Chemtrails",
     "transcript": "",
     "alt": "Ants have reverse chemtrails--regular citizens spraying chemicals everywhere they go to control the government.",
     "img": "https://imgs.xkcd.com/comics/chemtrails.png",
     "title": "Chemtrails",
     "day": "3"
 }
*/
