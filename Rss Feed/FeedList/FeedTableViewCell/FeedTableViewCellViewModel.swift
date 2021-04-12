//
//  FeedTableViewCellViewModel.swift
//  Rss Feed
//
//  Created by Альберт Садыков on 10.04.2021.
//

import Foundation

class FeedTableViewCellViewModel: FeedTableViewCellViewModelProtocol{
    
    private var feed: Result!
    
    var stringUrl: String?{
        get{
            return feed.artworkUrl100
        }
    }
    
    var name: String?{
        return feed.name
    }
    
    required init(feed: Result){
        self.feed = feed
    }
    
    func getImage(completion: @escaping (Data?) -> Void) {
        
        ImageManager.shared.getImageData(stringUrl: stringUrl) {[weak self] (imageData, stringUrl) in
            guard self?.stringUrl == stringUrl else {return}
            completion(imageData)
        }
        
    }
    
    
}
