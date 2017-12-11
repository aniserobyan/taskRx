//
//  VideoCell.swift
//  taskRx
//
//  Created by Ani Serobyan on 12/10/17.
//  Copyright © 2017 Helix Consulting. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell {
    @IBOutlet weak var imgVideoItem: UIImageView!

    var detailInfo: VideoItem? {
        didSet {
            let url = URL(string: (detailInfo?.thumbnail)!)
            self.imgVideoItem.af_setImage(withURL: url!)
        }
    }
}
