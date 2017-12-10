//
//  GalleryItemVC.swift
//  taskRx
//
//  Created by Ani Serobyan on 12/7/17.
//  Copyright © 2017 Helix Consulting. All rights reserved.
//

import UIKit

class GalleryItemVC: UIViewController {
    @IBOutlet weak var imgGalleryItem: UIImageView!
    @IBOutlet weak var btnClose: UIButton!
    
    var imageGalleryItem: GalleryItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: (imageGalleryItem?.thumbnail)!)
        self.imgGalleryItem.af_setImage(withURL: url!)
        
    }

    @IBAction func btnCloseTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
