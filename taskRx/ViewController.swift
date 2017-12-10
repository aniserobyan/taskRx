//
//  ViewController.swift
//  taskRx
//
//  Created by Ani Serobyan on 11/28/17.
//  Copyright © 2017 Helix Consulting. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var newsArr = [News]()
    var readNews = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NewsAPI(requester: AlamofireRequester()).getNews { (error, news) in
            if let unwrappedNews = news {
                self.newsArr = unwrappedNews
            }
            self.tableView.reloadData()
        }
        self.readNews = UserDefaults.standard.object(forKey: "markAsReadArr") as? [Int] ?? []
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCellId") as! NewsCell
        if self.readNews.contains(indexPath.row) {
            cell.isRead = true
        } else {
            cell.isRead = false
        }
        cell.news = self.newsArr[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        detailVC.news = self.newsArr[indexPath.row]
        self.readNews.append(indexPath.row)
        let cell = self.tableView.cellForRow(at: indexPath) as! NewsCell
        cell.isRead = true
        UserDefaults.standard.set(readNews, forKey: "markAsReadArr")
        UserDefaults.standard.synchronize()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }

}

