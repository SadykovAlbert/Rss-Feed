//
//  FeedModel.swift
//  Rss Feed
//
//  Created by Альберт Садыков on 08.04.2021.
//


import Foundation

// MARK: - FeedModel
struct FeedModel: Codable {
    let feed: Feed
}

// MARK: - Feed
struct Feed: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let artistName, releaseDate, name, collectionName: String
    let copyright: String
    let artworkUrl100: String
}
