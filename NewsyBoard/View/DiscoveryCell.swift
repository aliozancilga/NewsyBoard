//
//  DiscoveryCell.swift
//  NewsyBoard
//
//  Created by Macbook on 14.09.2018.
//  Copyright © 2018 Ali Ozan. All rights reserved.
//

import UIKit

class DiscoveryCell: UICollectionViewCell {
    @IBOutlet weak var sourceImage: UIImageView!
   
 
    
    func discoveryUI(_ discovery: Sources) {
   
        guard let name = discovery.id else { return }
        
        self.sourceImage.getSource(values: name, contentMode: .scaleAspectFit)
    }
    
}
