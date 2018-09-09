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
        
   

//        DispatchQueue.main.async {
//            let url = URL(string: news.urlToImage!)
//            let data = try? Data(contentsOf: url!)
//            self.urlToImage.image = UIImage(data: data!)
//        }
        
 
            
        

        self.urlToImage.downloadImageFrom(link: "https://mediadc.brightspotcdn.com/dims4/default/1a4c7da/2147483647/strip/true/crop/2290x1202+0+0/resize/1200x630!/quality/90/?url=https%3A%2F%2Fmediadc.brightspotcdn.com%2F59%2F8c%2Fb760bf144df98fe9523d2ad711de%2Fap-18008650737527.jpg", contentMode: .scaleAspectFit)
        self.source.text = news.source.name
        self.title.text = news.title
        self.publishAt.text = news.publishedAt
        
        
        
//        NewsCell.downloadImage(url: news.urlToImage) { (success, image) in
//
//            if success == true {
//                DispatchQueue.main.async {
//
//                    self.urlToImage.image = image
//                    self.source.text = news.source.name
//                    self.title.text = news.title
//                    self.publishAt.text = news.publishedAt
//
//                }
//            }
//
//        }
//
        
            
        
       // self.urlToImage.setImageFromURl(ImageUrl: "https://mediadc.brightspotcdn.com/dims4/default/1a4c7da/2147483647/strip/true/crop/2290x1202+0+0/resize/1200x630!/quality/90/?url=https%3A%2F%2Fmediadc.brightspotcdn.com%2F59%2F8c%2Fb760bf144df98fe9523d2ad711de%2Fap-18008650737527.jpg")
        

//        let imageUrl = URL(string: news.urlToImage!)
//        let imgData = try! Data(contentsOf: imageUrl!)
//        self.urlToImage.image = UIImage(data: imgData)
//
      
    }
    
   

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    static func downloadImage(url urlString: String, completion: @escaping (Bool,UIImage?) -> ()){
        
        let imgUrl = URL(string: urlString)
        
        guard let unwrapped = imgUrl else{ return }
        
        let request = URLRequest(url: unwrapped)
        
        let session = URLSession.shared
        
        
        session.dataTask(with: request) { (data, response, error) in
            
            
            guard let data = data , let image = UIImage(data: data) else { completion(false,nil); return }
            
            completion(true , image)
            
        }.resume()
        
    }
    
}

extension UIImageView {
    func downloadImageFrom(link:String, contentMode: UIViewContentMode) {
        URLSession.shared.dataTask( with: NSURL(string:link)! as URL, completionHandler: { (data, response, error) -> Void in
            DispatchQueue.main.async() {
                self.contentMode =  contentMode
                if let data = data { self.image = UIImage(data: data) }
            }
        }).resume()
    }
}
class ImageLoader {
    
    private static let cache = NSCache<NSString, NSData>()
    
    class func image(for url: URL, completionHandler: @escaping(_ image: UIImage?) -> ()) {
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
            
            if let data = self.cache.object(forKey: url.absoluteString as NSString) {
                DispatchQueue.main.async { completionHandler(UIImage(data: data as Data)) }
                return
            }
            
            guard let data = NSData(contentsOf: url) else {
                DispatchQueue.main.async { completionHandler(nil) }
                return
            }
            
            self.cache.setObject(data, forKey: url.absoluteString as NSString)
            DispatchQueue.main.async { completionHandler(UIImage(data: data as Data)) }
        }
    }
    
}
