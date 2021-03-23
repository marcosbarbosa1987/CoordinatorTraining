//
//  HomeEntity.swift
//  CoordinatorTest
//
//  Created by Marcos Barbosa on 14/03/21.
//

import Foundation

// MARK: - Welcome
struct HomeEntity: Codable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let items: [Item]?

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

// MARK: - Item
struct Item: Codable {
    let name: String?
    let owner: Owner?
}

struct Owner: Codable {
    let avatar_url: String?
    let html: String?
}
