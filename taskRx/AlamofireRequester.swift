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
        Alamofire.request(url,
                          method: HTTPMethod(rawValue: method.rawValue)!,
                          parameters: params,
                          encoding: JSONEncoding.default,
                          headers: nil).responseJSON { (response) in
                            handler?(response.error, response.result.value as? [String : Any])
        }
        
        
    }
    
}
