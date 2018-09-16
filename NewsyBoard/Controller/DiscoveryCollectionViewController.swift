//
//  DiscoveryCollectionViewController.swift
//  NewsyBoard
//
//  Created by Macbook on 14.09.2018.
//  Copyright © 2018 Ali Ozan. All rights reserved.
//

import UIKit
import SafariServices

private let reuseIdentifier = "Cell"

class DiscoveryCollectionViewController: UICollectionViewController,SFSafariViewControllerDelegate  {
    private var readerAvailableDiscovery : Bool? = nil
 
    var source = [Sources]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSource()

      
    }
    
    @IBOutlet var collectionview: UICollectionView!
    func fetchSource(){
        NetworkServices.shared.getSource { (data) in
            
            do{
                let decoder = JSONDecoder()
                
                let json  = try decoder.decode(SourcesModel.self, from: data as! Data)
                
                self.source = json.sources
            
                DispatchQueue.main.async {
                    self.collectionview.reloadData()
                }

                
            }catch _{
                return
            }
            
        }
    }
    
    
    private func openSafari(_ index:Int){
    
    guard let url = self.source[index].url else { return }
        
        if #available(iOS 11.0, *) {
            self.readerAvailableDiscovery = true
        }else{
            self.readerAvailableDiscovery = false
        }
        
        let safari = SFSafariViewController(url: URL(string: url)!, entersReaderIfAvailable: readerAvailableDiscovery!)
        self.present(safari, animated: true, completion: nil)
        safari.delegate = self
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
}

extension DiscoveryCollectionViewController {
        
        // MARK: UICollectionViewDataSource
        
//       override func numberOfSections(in collectionView: UICollectionView) -> Int {
//            // #warning Incomplete implementation, return the number of sections
//            return 1
//        }
//        
        
       override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of items
            return self.source.count
        }
        
       override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DiscoveryCell
            
              cell.discoveryUI(self.source[indexPath.row])
        
            return cell
        
        }
        
   override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    openSafari(indexPath.row)

 
     }
 
        
}


 

