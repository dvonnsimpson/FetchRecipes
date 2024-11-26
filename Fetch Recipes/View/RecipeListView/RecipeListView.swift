//
//  ContentView.swift
//  Fetch Recipes
//
//  Created by Donovan Simpson on 11/19/24.
//

import SwiftUI

struct RecipeListView: View {
    @State private var showSheet = false
    @StateObject var viewModel = RecipeListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if let recipes = viewModel.recipes, !recipes.isEmpty {
                    HStack {
                        Spacer()
                        FRCapsuleButton(title: Constants.RecipeListView.sort, action: {
                            viewModel.sheetType = .sort
                            showSheet = true
                        })
                        
                        FRCapsuleButton(title: Constants.RecipeListView.filter, action: {
                            viewModel.sheetType = .filter
                            showSheet = true
                        })
                    }
                    .padding(.horizontal)
                    
                    List {
                        ForEach(viewModel.filteredAndSortedRecipes(), id: \.uuid) { recipe in
                            RecipeListRow(recipe: recipe)
                        }
                    }
                    .refreshable {
                        await viewModel.getRecipes()
                        viewModel.defaultSortandFilterStates()
                    }
                } else if viewModel.isLoading {
                    LoadingView()
                } else if let error = viewModel.networkError {
                    ErrorView(action: { await viewModel.getRecipes() }, error: error)
                } else {
                    EmptyListView(action: { await viewModel.getRecipes() })
                }
            }
            .listStyle(.inset)
            .navigationTitle(Constants.RecipeListView.navigationTitle)
            .sheet(isPresented: $showSheet) {
                FilterSortSheet(sheetType: viewModel.sheetType, sortState: $viewModel.sortState, filterState: $viewModel.filterState, showSheet: $showSheet)
            }
        }
        .task {
            await viewModel.getRecipes()
        }
    }
}

#Preview {
    RecipeListView()
}
