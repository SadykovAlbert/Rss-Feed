//
//  NetworkManager.swift
//  Rss Feed
//
//  Created by Альберт Садыков on 08.04.2021.
//

import Foundation

class NetworkManager{
    
    static let shared = NetworkManager()
    private init(){}
    
    private let feedUrl = "https://rss.itunes.apple.com/api/v1/ru/apple-music/top-songs/all/50/explicit.json"
    
    
    func fetchData(completion: @escaping (_ feedModel: FeedModel) -> Void){
        
        guard let url = URL(string: feedUrl) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            guard let data = data else {return}
            
            do{
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let feeds = try decoder.decode(FeedModel.self, from: data)
                completion(feeds)
                
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
}
