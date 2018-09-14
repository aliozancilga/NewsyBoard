//
//  NewsListViewController.swift
//  NewsyBoard
//
//  Created by Macbook on 9.09.2018.
//  Copyright © 2018 Ali Ozan. All rights reserved.
//

import UIKit

class NewsListViewController: UITableViewController {
    fileprivate let Cell = "cell"
    fileprivate let detailSegue = "detailnews"

    var newsData = [Articles]()
    
    @IBOutlet var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
         fetch()
     }
    
    func fetch(){
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
    
    }
extension NewsListViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.newsData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = self.tableview.dequeueReusableCell(withIdentifier: self.Cell, for: indexPath) as! NewsCell
            cell.setupUI(news: self.newsData[indexPath.row])
            return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let send = newsData[indexPath.row]
         performSegue(withIdentifier: self.detailSegue, sender: send)
     }
    
    // MARK: - Navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? NewsDetailViewController else {return}
        guard let fornews = sender as? Articles else { return }
        destination.fullmodel = fornews
        
    }
    
}
