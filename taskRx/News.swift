//
//  News.swift
//  taskRx
//
//  Created by Ani Serobyan on 11/29/17.
//  Copyright © 2017 Helix Consulting. All rights reserved.
//

import Foundation
import ObjectMapper

class News: Mappable {
    var title: String?
    var category: String?
    var date: Date?
    var image: String?
    var body: String?
    var gallery: [GalleryItem]?
    var videos: [VideoItem]?
    
    required init(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.title <- map["title"]
        self.category <- map["category"]
        self.date <- (map["date"], DateTransform())
        self.image <- map["coverPhotoUrl"]
        self.body <- map["body"]
        self.gallery <- map["gallery"]
        self.videos <- map["video"]
    }
}
