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
        
    
    var viewModel: FeedDetailsViewModelProtocol!
    
    var feed: Result!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI(){
        collectionNameLabel.text = viewModel.collectionName
        songNameLabel.text = viewModel.name
        artistNameLabel.text  = viewModel.artistName
        releaseDateLabel.text = viewModel.releaseDate
        copyrightLabel.text = viewModel.copyright
        
        viewModel.setImage {[weak self] (imageData) in
            guard let imageData = imageData else {return}
            self?.imageView.image = UIImage(data: imageData)
        }
    }

    
}
