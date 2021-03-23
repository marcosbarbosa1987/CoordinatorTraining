//
//  HomeViewController.swift
//  CoordinatorTest
//
//  Created by Marcos Barbosa on 23/03/21.
//

import UIKit

class HomeViewController: UIViewController, Storyboarded {

    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.delegate = self
            self.tableView.dataSource = self
        }
    }
    
    // MARK: - Properties
    
    weak var coordinator: MainCoordinator?
    let languages: [String] = ["swift"]
    
    // MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // MARK: - Implements click in cell
        
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = languages[indexPath.row]
        
        return cell
    }
}
