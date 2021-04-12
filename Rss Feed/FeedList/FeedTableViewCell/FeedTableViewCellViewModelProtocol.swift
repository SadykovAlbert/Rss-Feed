//
//  FeedTableViewCellViewModelProtocol.swift
//  Rss Feed
//
//  Created by Альберт Садыков on 10.04.2021.
//

import Foundation


protocol FeedTableViewCellViewModelProtocol {
    var stringUrl: String?{get}
    var name: String?{get}
    func getImage(completion: @escaping (Data?) -> Void)
}
