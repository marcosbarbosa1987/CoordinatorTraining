//
//  HomeViewModel.swift
//  CoordinatorTest
//
//  Created by Marcos Barbosa on 14/03/21.
//

import Foundation

protocol HomeViewModelRequest {
    func getAllRepositories(withURL url: String)
}

protocol HomeViewModelResponse {
    func fetchedRepositories(_ repositories: HomeEntity)
    func failFetchedRepositories()
}

class HomeViewModel {
    
    private var delegate: HomeViewModelResponse?
    
    init(delegate: HomeViewModelResponse) {
        self.delegate = delegate
    }
}

extension HomeViewModel: HomeViewModelRequest {
    
    func getAllRepositories(withURL url: String) {
        
        HttpRequest.get(url: url) { (result) in
            switch result {
            case .success(let response):
                if let repositories = response {
                    self.delegate?.fetchedRepositories(repositories)
                } else {
                    self.delegate?.failFetchedRepositories()
                }
                
            case .failure:
                self.delegate?.failFetchedRepositories()
            }
        }
    }
}
