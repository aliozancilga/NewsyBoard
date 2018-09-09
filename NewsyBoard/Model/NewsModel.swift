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
    
//    init(status:String,totalResults:Int, articles:Articles) {
//        self.status = status
//        self.totalResults = totalResults
//        self.articles = [articles]
//    }
    
}

struct Articles: Decodable {
    let source : Source
    let author : String?
    let title : String?
    let description : String?
    let url : String?
    let urlToImage : String?
    let publishedAt : String?
    
//    init(source: Source, author: String, title: String, description:String, url: String, urlToImage:String, publishedAt: String) {
//        self.source = source
//        self.author = author
//        self.title  = title
//        self.description = description
//        self.url = url
//        self.urlToImage = urlToImage
//        self.publishedAt = publishedAt
//    }
    
}

struct Source: Decodable{
    let id : String?
    let name: String?
    
    
//    init(id: String,name:String) {
//        self.id = id
//        self.name = name
//    }

    
}


