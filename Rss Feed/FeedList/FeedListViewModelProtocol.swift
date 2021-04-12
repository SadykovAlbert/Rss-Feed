//
//  FeedListViewModelProtocol.swift
//  Rss Feed
//
//  Created by Альберт Садыков on 10.04.2021.
//

import Foundation

protocol FeedListViewModelProtocol {
    var feeds: [Result]{get}
    func receiveFeeds(completion: @escaping () -> Void)
    func numberOfRows() -> Int?
    func getCellViewModel(with indexPath: IndexPath) -> FeedTableViewCellViewModelProtocol?
    func getFeedDetailsViewModel(with indexPath: IndexPath) -> FeedDetailsViewModelProtocol?

}
