//
//  GalleryCell.swift
//  taskRx
//
//  Created by Ani Serobyan on 12/6/17.
//  Copyright © 2017 Helix Consulting. All rights reserved.
//

import UIKit

class GalleryCell: UICollectionViewCell {
    @IBOutlet weak var imgGalleryItem: UIImageView!
    
    var detailInfo: GalleryItem? {
        didSet {
            let url = URL(string: (detailInfo?.thumbnail)!)
            self.imgGalleryItem.af_setImage(withURL: url!)
        }
    }
}
