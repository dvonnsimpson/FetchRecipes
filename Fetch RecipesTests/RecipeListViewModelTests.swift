//
//  RecipeListViewModelTests.swift
//  Fetch RecipesTests
//
//  Created by Donovan Simpson on 11/25/24.
//

import XCTest
@testable import Fetch_Recipes

final class RecipeListViewModelTests: XCTestCase {
    var mockService: MockRecipeListViewService!
    var viewModel: RecipeListViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        mockService = MockRecipeListViewService()
        viewModel = RecipeListViewModel(recipeListViewService: mockService)
    }
    
    func testGetRecipesSuccessFull() async throws {
        // Given
        mockService.recipeListTestCase = .successFull
        
        // When
        await viewModel.getRecipes()
        let recipes = try XCTUnwrap(viewModel.recipes)
        
        // Then
        XCTAssert(!recipes.isEmpty)
    }
    
    func testGetRecipesSuccessEmpty() async throws {
        // Given
        mockService.recipeListTestCase = .successEmpty
        
        // When
        await viewModel.getRecipes()
        let recipes = try XCTUnwrap(viewModel.recipes)
        
        // Then
        XCTAssert(recipes.isEmpty)
    }
    
    func testGetRecipesFailure() async {
        // Given
        mockService.recipeListTestCase = .failure
        
        // When
        await viewModel.getRecipes()
        
        // Then
        XCTAssertNotNil(viewModel.networkError)
    }
    
    func testSortAlphabetical() async {
        // Given
        mockService.recipeListTestCase = .successFull
        
        // When
        await viewModel.getRecipes()
        viewModel.sortState = .alphabetical
        viewModel.filterState = .none
        let sortedRecipes = viewModel.filteredAndSortedRecipes()
        
        // Then
        XCTAssertEqual("0c6ca6e7-e32a-4053-b824-1dbf749910d8", sortedRecipes[0].uuid)
    }
    
    func testSortCuisine() async {
        // Given
        mockService.recipeListTestCase = .successFull
        
        // When
        await viewModel.getRecipes()
        viewModel.sortState = .cuisine
        viewModel.filterState = .none
        let sortedRecipes = viewModel.filteredAndSortedRecipes()
        
        // Then
        XCTAssertEqual("a4139f76-e677-4092-ba69-5d4c5134d9d8", sortedRecipes[0].uuid)
    }
    
    func testFilterHasYoutubeVideo() async {
        // Given
        mockService.recipeListTestCase = .successFull
        
        // When
        await viewModel.getRecipes()
        viewModel.sortState = .alphabetical
        viewModel.filterState = .hasVideo
        let sortedRecipes = viewModel.filteredAndSortedRecipes()
        
        // Then
        XCTAssertEqual(sortedRecipes.count, 2)
    }
    
    func testFilterHasSource() async {
        // Given
        mockService.recipeListTestCase = .successFull
        
        // When
        await viewModel.getRecipes()
        viewModel.sortState = .alphabetical
        viewModel.filterState = .hasSource
        let sortedRecipes = viewModel.filteredAndSortedRecipes()
        
        // Then
        XCTAssertEqual(sortedRecipes.count, 2)
    }
    
    func testSortWithFilter() async {
        // Given
        mockService.recipeListTestCase = .successFull
        
        // When
        await viewModel.getRecipes()
        viewModel.sortState = .cuisine
        viewModel.filterState = .hasSource
        let sortedRecipes = viewModel.filteredAndSortedRecipes()
        
        // Then
        XCTAssertEqual("0c6ca6e7-e32a-4053-b824-1dbf749910d8", sortedRecipes[0].uuid)
    }
}
