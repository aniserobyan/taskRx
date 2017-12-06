//
//  DetailVC.swift
//  taskRx
//
//  Created by Ani Serobyan on 12/5/17.
//  Copyright © 2017 Helix Consulting. All rights reserved.
//

import UIKit

class DetailVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!
    
    var news: News?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblCategory.text = news?.category
        self.lblTitle.text = news?.title
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd HH:mm"
        let myString = formatter.string(from: (news?.date!)!)
        self.lblDate.text = myString
        
        self.bodyTextView.text = news?.body
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.news?.gallery?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCell", for: indexPath) as! GalleryCell
        cell.detailInfo = self.news?.gallery![indexPath.row]
        return cell
    }
}
