//
//  Coordinator.swift
//  CoordinatorTest
//
//  Created by Marcos Barbosa on 14/03/21.
//

import UIKit

protocol Coordinator {
    
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
