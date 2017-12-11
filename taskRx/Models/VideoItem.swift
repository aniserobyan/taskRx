//
//  VideoItem.swift
//  taskRx
//
//  Created by Ani Serobyan on 12/10/17.
//  Copyright © 2017 Helix Consulting. All rights reserved.
//

import Foundation
import ObjectMapper

class VideoItem: Mappable {
    
    var title: String?
    var thumbnail: String?
    var youtubeId: String?
    
    required init(map: Map) {}
    
    func mapping(map: Map) {
        self.title <- map["title"]
        self.thumbnail <- map["thumbnailUrl"]
        self.youtubeId <- map["youtubeId"]
    }
}
