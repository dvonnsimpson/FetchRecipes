//
//  FRUrlButton.swift
//  Fetch Recipes
//
//  Created by Donovan Simpson on 11/25/24.
//

import SwiftUI

struct FRUrlButton: View {
    let systemImage: String
    let url: URL
    var body: some View {
        Link(destination: url, label: {
            Image(systemName: systemImage)
                .resizable()
                .scaledToFit()
                .frame(height: 16)
                .foregroundStyle(.foreground)
        })
        .buttonStyle(BorderlessButtonStyle())
    }
}

#Preview {
    FRUrlButton(systemImage: "book", url: URL(string: "https://www.google.com")!)
}
