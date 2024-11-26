//
//  RecipeListViewModel.swift
//  Fetch Recipes
//
//  Created by Donovan Simpson on 11/19/24.
//

import Foundation

final class RecipeListViewModel: ObservableObject {
    @Published var recipes: [Recipe]?
    @Published var networkError: NetworkingError?
    @Published var isLoading: Bool = false
    @Published var sortState: SortState = .alphabetical
    @Published var filterState: FilterState = .none
    @Published var sheetType: SheetType = .sort
    
    private let recipeListViewService: RecipeListViewServiceDelegate
    
    init(recipeListViewService: RecipeListViewServiceDelegate = RecipeListViewService()) {
        self.recipeListViewService = recipeListViewService
    }
    
    @MainActor
    func getRecipes() async {
        isLoading = true
        
        do {
            recipes = try await recipeListViewService.getRecipes().recipes
        } catch {
            print(error)
            networkError = error as? NetworkingError
        }
        
        isLoading = false
    }
    
    func filteredAndSortedRecipes() -> [Recipe] {
        guard let recipes else { return [] }
        var filteredAndSortedRecipes: [Recipe] = []
        
        switch filterState {
        case .none:
            filteredAndSortedRecipes = recipes
        case .hasVideo:
            filteredAndSortedRecipes = recipes.filter({ $0.youtubeUrl != nil })
        case .hasSource:
            filteredAndSortedRecipes = recipes.filter({ $0.sourceUrl != nil })
        }
        
        switch sortState {
        case .alphabetical:
            filteredAndSortedRecipes = filteredAndSortedRecipes.sorted(by: { $0.name < $1.name })
        case .cuisine:
            filteredAndSortedRecipes = filteredAndSortedRecipes.sorted(by: { $0.cuisine < $1.cuisine })
        }
        
        return filteredAndSortedRecipes
    }
    
    func defaultSortandFilterStates() {
        sortState = .alphabetical
        filterState = .none
    }
}

enum SortState: String, Identifiable, CaseIterable {

    var id: Self {
        return self
    }
    
    case alphabetical = "Alphabetical"
    case cuisine = "Cuisine"
}

enum FilterState: String, Identifiable, CaseIterable {
    var id: Self {
        return self
    }
    
    case none = "None"
    case hasVideo = "Has Youtube Video"
    case hasSource = "Has Source Recipe"
}
