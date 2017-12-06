//
//  Requestable.swift
//  taskRx
//
//  Created by Ani Serobyan on 11/29/17.
//  Copyright © 2017 Helix Consulting. All rights reserved.
//

import Foundation

enum AMHTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

protocol Requestable {
    func request(url:URL, method:AMHTTPMethod, params:[String:Any]?, completion handler: ((Error?, [String:Any]?)->Void)?)
}
