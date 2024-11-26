//
//  Constants.swift
//  Fetch Recipes
//
//  Created by Donovan Simpson on 11/19/24.
//

import Foundation

struct Constants {
    struct RecipeListView {
        static let navigationTitle = "Recipes"
        static let sort = "Sort"
        static let filter = "Filter"
    }
    
    struct LoadingView {
        static let message = "Getting your recipes shortly..."
    }
    
    struct EmptyListView {
        static let title = "No Recipes Available"
        static let systemImage = "fork.knife"
        static let description = "We currently don't have any recipes to show. Check back later!"
    }
    
    struct Errors {
        static let generalTitle = "Something went wrong"
        static let generalSFSymbol = "x.circle.fill"
        static let tryAgain = "Try Again"
    }
    
    struct FilterSortSheet {
        static let sortTitle = "Sort By"
        static let filterTitle = "Filter By"
        static let systemImage = "checkmark"
    }
}
