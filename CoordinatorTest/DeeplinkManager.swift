//
//  DeeplinkManager.swift
//  CoordinatorTest
//
//  Created by Marcos Barbosa on 22/03/21.
//

import UIKit

enum EnumDeeplink: String {
    case swift = "swift"
    case javascript = "javascript"
    case empty = ""
}

extension EnumDeeplink {
    static func getEnum(tag: String) -> EnumDeeplink {
        switch tag {
        case "swift":
            return .swift
            
        case "javascript":
            return .javascript
            
        default:
            return .empty
        }
    }
}

class DeepLinkManager {
    
    static func routerView(coordinator: MainCoordinator, tag: String?) {
        
        guard let deepLink = tag else { return }
        
        let router: EnumDeeplink = EnumDeeplink.getEnum(tag: deepLink)
        
        switch router {
        case .swift, .javascript:
            coordinator.goToLanguage(language: deepLink)
            
        default:
            break
        }
        
    }
}
