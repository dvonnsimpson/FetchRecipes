//
//  NetworkManager.swift
//  Fetch Recipes
//
//  Created by Donovan Simpson on 11/19/24.
//

import UIKit

final class NetworkManager: NSObject {
    private let cache = NSCache<NSString, UIImage>()
    static let shared = NetworkManager()
    
    let goodResponse = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
    let malformedResponse = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
    let emptyResponse = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"
    
    var isFirstLoad = true
    
    func getRecipes() async throws -> RecipeResponse {
        guard let url = URL(string: /*isFirstLoad ? malformedResponse : */goodResponse) else { throw NetworkingError.invalidUrl }
        
        isFirstLoad = false // this is here just so we can switch between the malformed and empty to the good response
        
        let request = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw NetworkingError.invalidResponse }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(RecipeResponse.self, from: data)
        } catch {
            throw NetworkingError.invalidData
        }
    }
    
    func downloadImage(from urlString: String) async throws -> UIImage? {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) { return image }
        
        guard let url = URL(string: urlString) else { return nil }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        if let image = UIImage(data: data) {
            self.cache.setObject(image, forKey: cacheKey)
            return image
        } else {
            return nil
        }
    }
}


enum NetworkingError: String, Error {
    case invalidUrl = "We're having trouble right now. Please try again."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
}
