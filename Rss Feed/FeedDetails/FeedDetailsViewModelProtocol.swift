//
//  FeedDetailsViewModelProtocol.swift
//  Rss Feed
//
//  Created by Альберт Садыков on 10.04.2021.
//

import Foundation

protocol FeedDetailsViewModelProtocol {
    var artistName: String? {get}
    var releaseDate: String? {get}
    var name: String? {get}
    var collectionName: String? {get}
    var copyright: String? {get}
    var artworkUrl100: String? {get}
    func setImage(completion: @escaping (Data?) -> Void)

    init(feed: Result)
}
