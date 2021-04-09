//
//  FeedTableViewCell.swift
//  Rss Feed
//
//  Created by Альберт Садыков on 09.04.2021.
//

import UIKit

class FeedTableViewCell: UITableViewCell{
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var imageV: UIImageView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var stringUrl: String?{
        didSet{
            self.imageV.image = nil
            updateUI()
        }
    }
    
    func updateUI(){
        
        spinner.startAnimating()
        self.spinner.isHidden = false
        
        ImageManager.shared.getImageData(stringUrl: stringUrl) {[weak self] (imageData, stringUrl) in
            guard self?.stringUrl == stringUrl else {return}
            self?.imageV?.image = UIImage(data: imageData)
            self?.spinner.stopAnimating()
            self?.spinner.isHidden = true
        }
        
    }
    
}
