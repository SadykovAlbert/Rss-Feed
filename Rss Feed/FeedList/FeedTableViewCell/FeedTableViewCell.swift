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
    
    var cellViewModel: FeedTableViewCellViewModelProtocol!{
        didSet{
            
            self.nameLabel.text = cellViewModel.name
            self.imageV.image = nil
            
            spinner.startAnimating()
            self.spinner.isHidden = false
            
            cellViewModel.getImage {[weak self] (imageData) in
                guard let imageData = imageData else {return}
                self?.imageV?.image = UIImage(data: imageData)
                self?.spinner.stopAnimating()
                self?.spinner.isHidden = true
            }
            
        }
        
    }
 
    
}
