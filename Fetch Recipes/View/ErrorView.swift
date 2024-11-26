//
//  ErrorView.swift
//  Fetch Recipes
//
//  Created by Donovan Simpson on 11/19/24.
//

import SwiftUI

struct ErrorView: View {
    let action: () async -> Void
    let error: NetworkingError
    
    var body: some View {
        ContentUnavailableView(label: {
            Label(Constants.Errors.generalTitle, systemImage: Constants.Errors.generalSFSymbol)
        }, description: {
            Text(error.rawValue)
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
    ErrorView(action: {}, error: NetworkingError.invalidData)
}
