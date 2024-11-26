//
//  MockRecipeListViewService.swift
//  Fetch RecipesTests
//
//  Created by Donovan Simpson on 11/25/24.
//

import Foundation
@testable import Fetch_Recipes

class MockRecipeListViewService: RecipeListViewServiceDelegate {
    var recipeListTestCase: RecipeListTestCase = .failure
    
    func getRecipes() async throws -> Fetch_Recipes.RecipeResponse {
        switch recipeListTestCase {
        case .failure:
            throw NetworkingError.invalidData
        case .successFull:
            return .mock
        case .successEmpty:
            return .emptyMock
        }
    }
    
    
}

enum RecipeListTestCase {
    case failure
    case successFull
    case successEmpty
}
