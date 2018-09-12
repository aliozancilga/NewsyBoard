//
//  NewsDetailViewController.swift
//  NewsyBoard
//
//  Created by Macbook on 10.09.2018.
//  Copyright © 2018 Ali Ozan. All rights reserved.
//

import UIKit
import SafariServices

class NewsDetailViewController: UIViewController , SFSafariViewControllerDelegate {
    
    var fullmodel : Articles!
    var readerAvailable : Bool? = nil
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var descriptionN: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let imageUrl = fullmodel.urlToImage else {return}
       newsImage.loadImageWithCache(link: imageUrl, contentMode: .scaleAspectFit)
       descriptionN.text = fullmodel.description
        newsTitle.text = fullmodel.title

        // Do any additional setup after loading the view.
    }

    @IBAction func readMore(_ sender: Any) {
         openSafari()
        
    }
    
    func openSafari(){
        guard let url = fullmodel.url else { return }
        
    if #available(iOS 11.0, *) {
        self.readerAvailable = true
    }else{
        self.readerAvailable = false
        }
        
        let safari = SFSafariViewController(url: URL(string: url)!, entersReaderIfAvailable: readerAvailable!)
        self.present(safari, animated: true, completion: nil)
        safari.delegate = self
 
    }
    
}
