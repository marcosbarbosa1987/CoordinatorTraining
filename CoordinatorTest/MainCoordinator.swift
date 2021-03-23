//
//  MainCoordinator.swift
//  CoordinatorTest
//
//  Created by Marcos Barbosa on 14/03/21.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController
    var window: UIWindow
    
    init(window: UIWindow) {
        self.navigationController = UINavigationController()
        self.window = window
    }
    
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        startMain()
    }
    
    func startMain() {
        let vc = HomeViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func goToLanguage(language: String) {
        let vc = MainViewController.instantiate()
        vc.coordinator = self
        vc.language = language
        navigationController.pushViewController(vc, animated: true)
    }
    
    func createAccount() {
//        let vc = CreateAccountViewController.instantiate()
//        vc.coordinator = self
//        navigationController.pushViewController(vc, animated: true)
    }
}
