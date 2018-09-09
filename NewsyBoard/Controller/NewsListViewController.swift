//
//  NewsListViewController.swift
//  NewsyBoard
//
//  Created by Macbook on 9.09.2018.
//  Copyright © 2018 Ali Ozan. All rights reserved.
//

import UIKit

class NewsListViewController: UITableViewController {
    
    var newsData = [Articles]()
    
     @IBOutlet var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkServices.shared.getData { (data) in
            
             do{
                let decoder = JSONDecoder()
                let json = try decoder.decode(NewsModel.self, from: data as! Data )
                
                self.newsData = json.articles
                DispatchQueue.main.async {
                    
                    self.tableview.reloadData()
                    
                }
        }catch {
                print(error)
            }
        
        }
        
     }
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension NewsListViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsData.count
    }
  
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = self.tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsCell
            cell.setupUI(news: self.newsData[indexPath.row])
            return cell
        
        
    }
    
    
    
}
