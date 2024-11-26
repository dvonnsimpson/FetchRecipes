//
//  LoadingView.swift
//  Fetch Recipes
//
//  Created by Donovan Simpson on 11/19/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
                .controlSize(.extraLarge)
                .padding(.bottom)
            
            Text(Constants.LoadingView.message)
                .font(.headline)
        }
    }
}

#Preview {
    LoadingView()
}
