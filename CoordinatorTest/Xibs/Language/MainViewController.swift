//
//  MainViewController.swift
//  CoordinatorTest
//
//  Created by Marcos Barbosa on 14/03/21.
//

import UIKit

class MainViewController: UIViewController, Storyboarded {
    
    // MARK: - Properties
    
    weak var coordinator: MainCoordinator?
    internal var language: String?
    private var viewModel: HomeViewModel?
    private var repositories: HomeEntity?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let language = self.language {
            self.title = language
            
            viewModel = HomeViewModel(delegate: self)
            viewModel?.getAllRepositories(withURL: Constants.home.rawValue.replacingOccurrences(of: "{1}", with: language))
        } else {
            
        }
    }
}

// MARK: - ViewModelResponse

extension MainViewController: HomeViewModelResponse {
   
    func fetchedRepositories(_ repositories: HomeEntity) {
        DispatchQueue.main.async {
            self.repositories = repositories
            self.tableView.reloadData()
        }
    }
    
    func failFetchedRepositories() {
        // MARK: - Implements error
    }
}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repositories?.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        if let item = repositories?.items?[indexPath.row] {
            cell.textLabel?.text = item.name
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
