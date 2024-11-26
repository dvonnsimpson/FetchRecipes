//
//  RecipeResponse.swift
//  Fetch Recipes
//
//  Created by Donovan Simpson on 11/19/24.
//

import Foundation

struct RecipeResponse: Codable, Hashable {
    let recipes: [Recipe]
}

struct Recipe: Codable, Hashable {
    let cuisine: String
    let name: String
    let photoUrlLarge: String?
    let photoUrlSmall: String?
    let uuid: String
    let sourceUrl: String?
    let youtubeUrl: String?
}
