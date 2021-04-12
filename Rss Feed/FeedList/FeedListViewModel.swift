//
//  FeedListViewModel.swift
//  Rss Feed
//
//  Created by Альберт Садыков on 10.04.2021.
//

import Foundation


class FeedListViewModel: FeedListViewModelProtocol {
    
    var feeds: [Result] = []
    
    func receiveFeeds(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchData {[weak self] (feedModel) in
            self?.feeds = feedModel.feed.results
            DispatchQueue.main.async {
                completion()
            }
        }
        
    }
    
    func numberOfRows() -> Int? {
        return feeds.count
    }
    
    func getCellViewModel(with indexPath: IndexPath) -> FeedTableViewCellViewModelProtocol?{
        if feeds.indices.contains(indexPath.row){
            let cellViewModel = FeedTableViewCellViewModel(feed: feeds[indexPath.row])
            return cellViewModel
        }
        else {return nil}
    }
    
    func getFeedDetailsViewModel(with indexPath: IndexPath) -> FeedDetailsViewModelProtocol? {
        if feeds.indices.contains(indexPath.row){
            let feedDetailsViewModel = FeedDetailsViewModel(feed: feeds[indexPath.row])
            return feedDetailsViewModel
        }
        else {return nil}
    }
    
    
}
