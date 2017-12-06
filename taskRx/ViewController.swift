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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NewsAPI(requester: AlamofireRequester()).getNews { (error, news) in
            if let unwrappedNews = news {
                self.newsArr = unwrappedNews
            }
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCellId") as! NewsCell
        cell.news = self.newsArr[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        detailVC.news = self.newsArr[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }

}

