//
//  FeedDetailsViewController.swift
//  Rss Feed
//
//  Created by Альберт Садыков on 09.04.2021.
//

import UIKit

class FeedDetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var collectionNameLabel: UILabel!
    
    @IBOutlet weak var songNameLabel: UILabel!
    
    @IBOutlet weak var artistNameLabel: UILabel!
    
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    @IBOutlet weak var copyrightLabel: UILabel!
        
    
    var feed: Result!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI(){
        
        collectionNameLabel.text = feed.collectionName
        songNameLabel.text = feed.name
        artistNameLabel.text  = feed.artistName
        releaseDateLabel.text = feed.releaseDate
        copyrightLabel.text = feed.copyright
        
        ImageManager.shared.getImageData(stringUrl: feed.artworkUrl100) {[weak self] (imageData, _) in
            self?.imageView?.image = UIImage(data: imageData)
        }
    }

    
}
