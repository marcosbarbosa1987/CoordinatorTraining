//
//  Storyboarded.swift
//  CoordinatorTest
//
//  Created by Marcos Barbosa on 14/03/21.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate() -> Self {
     
        // MARK: - This pull out "MyApp.MyViewController"
        let fullName = NSStringFromClass(self)
        
        // MARK: - This splits by the dot and uses everything after, giving "MyViewController"
        let className = fullName.components(separatedBy: ".")[1]
        
        // MARK: - Load out storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // MARK: - Instantiate a view controller with that identifier, and force cast as the type that was requested
        return storyboard.instantiateViewController(identifier: className)
    }
}
