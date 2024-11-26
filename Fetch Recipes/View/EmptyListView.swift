//
//  EmptyListView.swift
//  Fetch Recipes
//
//  Created by Donovan Simpson on 11/19/24.
//

import SwiftUI

struct EmptyListView: View {
    let action: () async -> Void
    
    var body: some View {
        ContentUnavailableView(label: {
            Label(Constants.EmptyListView.title, systemImage: Constants.EmptyListView.systemImage)
        }, description: {
            Text(Constants.EmptyListView.description)
        }, actions: {
            Button(action: {
                Task { await action() }
            }) {
                Text(Constants.Errors.tryAgain)
            }
        })
    }
}

#Preview {
    EmptyListView(action: {})
}
