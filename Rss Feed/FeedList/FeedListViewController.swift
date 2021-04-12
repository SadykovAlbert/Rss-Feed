//
//  FeedListViewController.swift
//  Rss Feed
//
//  Created by Альберт Садыков on 08.04.2021.
//

import UIKit



class FeedListViewController: UIViewController {
        
    @IBOutlet var tableView: UITableView!
    
    var viewModel: FeedListViewModelProtocol!{
        didSet{
            viewModel.receiveFeeds {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = FeedListViewModel()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        let detailVC = segue.destination as! FeedDetailsViewController
        let feedDetailsViewModel = viewModel.getFeedDetailsViewModel(with: indexPath)
        detailVC.viewModel = feedDetailsViewModel
    }
  
    
}


extension FeedListViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as! FeedTableViewCell
        
        let cellViewModel = viewModel.getCellViewModel(with: indexPath)
        cell.cellViewModel = cellViewModel
                
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
