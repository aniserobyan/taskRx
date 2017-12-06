//
//  NewsCell.swift
//  taskRx
//
//  Created by Ani Serobyan on 12/1/17.
//  Copyright © 2017 Helix Consulting. All rights reserved.
//

import UIKit
import AlamofireImage

class NewsCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var imgCover: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var news: News? {
        didSet {
            self.lblTitle.text = news?.title
            self.lblCategory.text = news?.category
            
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM dd HH:mm"
            let myString = formatter.string(from: (news?.date!)!)
            self.lblDate.text = myString
            
            let url = URL(string: (news?.image)!)!
            self.imgCover.af_setImage(withURL: url)
        }
    }
}
