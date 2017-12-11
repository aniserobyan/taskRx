//
//  GalleryItem.swift
//  taskRx
//
//  Created by Ani Serobyan on 12/5/17.
//  Copyright © 2017 Helix Consulting. All rights reserved.
//

import Foundation
import ObjectMapper

class GalleryItem: Mappable {
    var title: String?
    var thumbnail: String?
    var contenctUrl: String?
    
    required init(map: Map) {}
    
    func mapping(map: Map) {
        self.title <- map["title"]
        self.thumbnail <- map["thumbnailUrl"]
        self.contenctUrl <- map["contentUrl"]
    }
    
    
}
