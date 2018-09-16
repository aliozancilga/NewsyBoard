//
//  SourcesModel.swift
//  NewsyBoard
//
//  Created by Macbook on 15.09.2018.
//  Copyright © 2018 Ali Ozan. All rights reserved.
//

import Foundation

struct SourcesModel: Decodable {
    let sources: [Sources]
}

struct Sources: Decodable {
    let id:String?
    let name:String?
    let description: String?
    let url: String?
    let category: String?
    let language : String?
    let country: String?
}
