//
//  MockData.swift
//  Fetch Recipes
//
//  Created by Donovan Simpson on 11/25/24.
//

import Foundation

extension RecipeResponse {
    static let mock = RecipeResponse(recipes: [.mock1, .mock2, .mock3])
    static let emptyMock = RecipeResponse(recipes: [])
}

extension Recipe {
    static let mock1 = Recipe(cuisine: "Tunisian",
                              name: "Cashew Ghoriba Biscuits",
                              photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/9c7fa988-1bbe-4bed-9f1a-c9d4d8b311da/large.jpg",
                              photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/9c7fa988-1bbe-4bed-9f1a-c9d4d8b311da/small.jpg",
                              uuid: "7eeb0865-b41c-4a3b-80dd-a69d32dccc7d",
                              sourceUrl: "http://allrecipes.co.uk/recipe/40152/cashew-ghoriba-biscuits.aspx",
                              youtubeUrl: nil)
    
    static let mock2 = Recipe(cuisine: "Malaysian",
                              name: "Apam Balik",
                              photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
                              photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
                              uuid: "0c6ca6e7-e32a-4053-b824-1dbf749910d8",
                              sourceUrl: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
                              youtubeUrl: "https://www.youtube.com/watch?v=6R8ffRRJcrg")
    
    static let mock3 = Recipe(cuisine: "British",
                              name: "Christmas Pudding Flapjack",
                              photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/ed302719-f455-4109-948d-839f690a9ea8/large.jpg",
                              photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/ed302719-f455-4109-948d-839f690a9ea8/small.jpg",
                              uuid: "a4139f76-e677-4092-ba69-5d4c5134d9d8",
                              sourceUrl: nil,
                              youtubeUrl: "https://www.youtube.com/watch?v=OaqvGvEiwzU")
}
