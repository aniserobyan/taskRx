//
//  AlamofireRequester.swift
//  taskRx
//
//  Created by Ani Serobyan on 11/30/17.
//  Copyright © 2017 Helix Consulting. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireRequester: Requestable {
    func request(url: URL, method: AMHTTPMethod, params: [String : Any]?, completion handler: ((Error?, [String : Any]?) -> Void)?) {
        if Utils.isInternetAvailable() {
            
            Alamofire.request(url,
                              method: HTTPMethod(rawValue: method.rawValue)!,
                              parameters: params,
                              encoding: JSONEncoding.default,
                              headers: nil).responseJSON { (response) in
                                UserDefaults.standard.set(response.result.value, forKey: "news")
                                handler?(response.error, response.result.value as? [String : Any])
                                UserDefaults.standard.synchronize()
            }
        } else {
            let news = UserDefaults.standard.object(forKey: "news")
            handler?(nil, news as? [String : Any])
        }
        
    }
    
}
