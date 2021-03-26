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
        if tag.contains("coordinatorApp://") {
            
            let link = tag.replacingOccurrences(of: "coordinatorApp://", with: "")
            
            switch link {
            case "swift":
                return .swift
                
            case "javascript":
                return .javascript
                
            default:
                return .empty
            }
        } else {
            return .empty
        }
    }
    
    static func getTitle(type: EnumDeeplink) -> String {
        return type.rawValue
    }
}

class DeepLinkManager {
    
    static func routerView(coordinator: MainCoordinator, tag: String?) {
        
        guard let deepLink = tag else { return }
        
        let router: EnumDeeplink = EnumDeeplink.getEnum(tag: deepLink)
        
        switch router {
        case .swift, .javascript:
            coordinator.goToLanguage(language: EnumDeeplink.getTitle(type: router))
            
        default:
            break
        }
        
    }
}
