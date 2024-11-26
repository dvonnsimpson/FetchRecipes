//
//  RecipeListRow.swift
//  Fetch Recipes
//
//  Created by Donovan Simpson on 11/25/24.
//

import SwiftUI

struct RecipeListRow: View {
    let recipe: Recipe
    
    var body: some View {
        HStack(spacing: 16) {
            RemoteImage(urlString: recipe.photoUrlSmall ?? "")
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .truncationMode(.middle)
                
                Text(recipe.cuisine)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                
                HStack {
                    if let youtubeUrl = recipe.youtubeUrl, let url = URL(string: youtubeUrl) {
                        FRUrlButton(systemImage: "play", url: url)
                    }
                    
                    if let sourceUrl = recipe.sourceUrl, let url = URL(string: sourceUrl) {
                        FRUrlButton(systemImage: "book", url: url)
                    }
                }
                .padding(.top)
            }
        }
    }
}

#Preview {
    RecipeListRow(recipe: .mock1)
}
