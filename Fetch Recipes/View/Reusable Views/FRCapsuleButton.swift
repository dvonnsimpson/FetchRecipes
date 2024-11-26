//
//  FRCapsuleButton.swift
//  Fetch Recipes
//
//  Created by Donovan Simpson on 11/25/24.
//

import SwiftUI

struct FRCapsuleButton: View {
    let buttonPadding: CGFloat = 12
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: { action() }, label: {
            Text(title)
                .foregroundStyle(.white)
                .padding(buttonPadding)
                .background(.black).clipShape(Capsule())
        })
    }
}

#Preview {
    FRCapsuleButton(title: Constants.RecipeListView.sort, action: {})
}
