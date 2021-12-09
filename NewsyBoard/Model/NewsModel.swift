//
//  NewsModel.swift
//  NewsyBoard
//
//  Created by Macbook on 8.09.2018.
//  Copyright © 2018 Ali Ozan. All rights reserved.
//

import Foundation

struct NewsModel: Decodable {
    let status: String?
    let totalResults: Int?
    let articles : [Articles]
}

struct Articles: Decodable {
    let source : Source
    let author : String?
    let title : String?
    let description : String?
    let url : String?
    let urlToImage : String?
    let publishedAt : String?
}

struct Source: Decodable{
    let id : String?
    let name: String?
}
