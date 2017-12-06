//
//  API.swift
//  taskRx
//
//  Created by Ani Serobyan on 11/28/17.
//  Copyright © 2017 Helix Consulting. All rights reserved.
//

import Foundation
import ObjectMapper

fileprivate let url = URL(string: "https://www.helix.am/temp/json.php")!

class NewsAPI {

    
    private var requester: Requestable
    init(requester: Requestable) {
        self.requester = requester
    }
    
    func getNews(completion handler: ((Error?, [News]?)->Void)?) {
        self.requester.request(url: url, method: .get, params: nil) { (err, result) in
            var newsArr: [News]?
            if result != nil && err == nil {
                newsArr = []
                let metadata = result!["metadata"] as! [[String:Any]]
                for json in metadata {
                    let news = News(JSON: json)
                    newsArr?.append(news!)
                }
            }
            
            handler?(err, newsArr)
        }
    }
}







