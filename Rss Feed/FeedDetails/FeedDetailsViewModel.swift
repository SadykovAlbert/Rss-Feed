//
//  FeedDetailsViewModel.swift
//  Rss Feed
//
//  Created by Альберт Садыков on 10.04.2021.
//

import Foundation

class FeedDetailsViewModel: FeedDetailsViewModelProtocol {
    
    private var feed: Result!
    
    var artistName: String?{
        return feed.artistName
    }
    
    var releaseDate: String?{
        return feed.releaseDate
    }
    
    var name: String?{
        return feed.name
    }
    
    var collectionName: String?{
        return feed.collectionName
    }
    
    var copyright: String?{
        return feed.copyright
    }
    
    var artworkUrl100: String?{
        return feed.artworkUrl100
    }
    
    func setImage(completion: @escaping (Data?) -> Void){
        
        ImageManager.shared.getImageData(stringUrl: feed.artworkUrl100) { (imageData, _) in
            completion(imageData)
        }
        
    }
    
    required init(feed: Result) {
        self.feed = feed
    }
    
    
}
