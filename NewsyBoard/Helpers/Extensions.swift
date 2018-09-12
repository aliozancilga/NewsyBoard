//
//  Extensions.swift
//  NewsyBoard
//
//  Created by Macbook on 12.09.2018.
//  Copyright © 2018 Ali Ozan. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    func loadImageWithCache(link:String, contentMode: UIViewContentMode) {
        
        if let cacheImage = imageCache.object(forKey: link as AnyObject) {
            self.image = cacheImage as? UIImage
            return
        }
        
        URLSession.shared.dataTask( with: NSURL(string:link)! as URL, completionHandler: { (data, response, error) -> Void in
            DispatchQueue.main.async() {
                self.contentMode =  contentMode
                guard let downloadImage = UIImage(data: data!)  else { return }
                    
                imageCache.setObject(downloadImage, forKey: link as AnyObject)
                    
                    self.image = downloadImage
                    
            }
        }).resume()
    }
}
