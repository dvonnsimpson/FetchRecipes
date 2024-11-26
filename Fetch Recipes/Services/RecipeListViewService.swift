//
//  RecipeListViewService.swift
//  Fetch Recipes
//
//  Created by Donovan Simpson on 11/19/24.
//

import Foundation

protocol RecipeListViewServiceDelegate {
    func getRecipes() async throws -> RecipeResponse
}

class RecipeListViewService: RecipeListViewServiceDelegate {
    func getRecipes() async throws -> RecipeResponse {
        try await NetworkManager.shared.getRecipes()
    }
}
