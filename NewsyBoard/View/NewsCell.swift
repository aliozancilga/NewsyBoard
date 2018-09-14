//
//  NewsCell.swift
//  NewsyBoard
//
//  Created by Macbook on 8.09.2018.
//  Copyright © 2018 Ali Ozan. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
 
    @IBOutlet weak var publishAt: UILabel!
    
    @IBOutlet weak var source: UILabel!
    
    @IBOutlet weak var urlToImage: UIImageView!
    
    func setupUI(news: Articles) {
        
        guard let imageURL = news.urlToImage else { return }
        self.urlToImage.loadImageWithCache(link: imageURL, contentMode: .scaleAspectFit)
        

        self.source.text = news.source.name
        self.title.text = news.title
        self.publishAt.text = news.publishedAt
        
    func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
      }

    
 
  }
}

