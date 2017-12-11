//
//  DetailVC.swift
//  taskRx
//
//  Created by Ani Serobyan on 12/5/17.
//  Copyright © 2017 Helix Consulting. All rights reserved.
//

import UIKit
import AVKit

class DetailVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var videoCollectionView: UICollectionView!
    @IBOutlet weak var videoCollectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!
    
    var news: News!
    let moviePlayer = AVPlayerViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblCategory.text = news.category
        self.lblTitle.text = news.title
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd HH:mm"
        let myString = formatter.string(from: news.date!)
        self.lblDate.text = myString
        
        self.bodyTextView.text = news.body
        
        if (self.news.videos?.count ?? 0) == 0 {
            self.videoCollectionViewHeightConstraint.constant = 0
        }
    }
    
    func playVideoWithId(_ videoId: String) {
        let youtubeURL = URL(string: "https://www.youtube.com/watch?v=\(videoId)")!
        Youtube.h264videosWithYoutubeURL(youtubeURL, completion: { (videoInfo, error) -> Void in
            if let videoURLString = videoInfo?["url"] as? String, let videoURL = URL(string: videoURLString) {
                let player = AVPlayer(url: videoURL)
                self.moviePlayer.player = player
                self.present(self.moviePlayer, animated: true) {
                    self.moviePlayer.player!.play()
                }
            } else {
                let youtubeAppUrl = URL(string: "http://www.youtube.com/watch?v=" + videoId)
                UIApplication.shared.openURL(youtubeAppUrl!)
            }
        })
    }
}

extension DetailVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return self.news.gallery?.count ?? 0
        }
        return self.news.videos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCell", for: indexPath) as! GalleryCell
            cell.detailInfo = self.news.gallery?[indexPath.row]
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCell", for: indexPath) as! VideoCell
        cell.detailInfo = self.news.videos?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionView {
            let galleryItemVC = storyboard?.instantiateViewController(withIdentifier: "GalleryItemVC") as! GalleryItemVC
            galleryItemVC.imageGalleryItem = self.news.gallery![indexPath.row]
            self.present(galleryItemVC, animated: true, completion: nil)
            return
        }
        
        let videoItem = self.news.videos![indexPath.row]
        self.playVideoWithId(videoItem.youtubeId!)
    }
}

