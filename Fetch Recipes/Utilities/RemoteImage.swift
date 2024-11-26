//
//  RemoteImage.swift
//  Fetch Recipes
//
//  Created by Donovan Simpson on 11/19/24.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    @MainActor
    func load(fromURL urlString: String) async {
        
        do {
            let uiImage = try await NetworkManager.shared.downloadImage(from: urlString)
            guard let uiImage else { return }
            image = Image(uiImage: uiImage)
        } catch {
            print(error)
        }
    }
}

struct RemoteImage: View {
    @StateObject private var imageLoader = ImageLoader()
    var urlString: String
    
    var body: some View {
        VStack {
            if let image = imageLoader.image {
                image.resizable().scaledToFit()
            } else {
                Image(systemName: "fork.knife").resizable().scaledToFit()
            }
        }
        .onAppear {
            Task { await imageLoader.load(fromURL: urlString) }
        }
    }
}

#Preview {
    RemoteImage(urlString: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg")
}
