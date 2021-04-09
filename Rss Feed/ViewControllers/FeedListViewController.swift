//
//  FeedListViewController.swift
//  Rss Feed
//
//  Created by Альберт Садыков on 08.04.2021.
//

import UIKit



class FeedListViewController: UIViewController {
    
    var feeds: [Result] = []
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getFeed()
        
    }
    
    
    func getFeed(){
        NetworkManager.shared.fetchData {[weak self] (feedModel) in
            DispatchQueue.main.async {
                self?.feeds = feedModel.feed.results
                self?.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        let feed = feeds[indexPath.row]
        let detailVC = segue.destination as! FeedDetailsViewController
        detailVC.feed = feed
    }
    
}



extension FeedListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as! FeedTableViewCell
        
        cell.stringUrl =  feeds[indexPath.row].artworkUrl100
        cell.nameLabel.text = feeds[indexPath.row].name
        
        return cell
    }
    
}

extension FeedListViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
