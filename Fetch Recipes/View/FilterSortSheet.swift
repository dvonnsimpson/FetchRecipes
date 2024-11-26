//
//  FilterSortSheet.swift
//  Fetch Recipes
//
//  Created by Donovan Simpson on 11/19/24.
//

import SwiftUI

struct FilterSortSheet: View {
    let sheetType: SheetType
    @Binding var sortState: SortState
    @Binding var filterState: FilterState
    @Binding var showSheet: Bool
    
    let detentHeightFraction: CGFloat = 0.3
    
    var body: some View {
        VStack {
            switch sheetType {
            case .sort:
                Text(Constants.FilterSortSheet.sortTitle)
                    .font(.headline)
                
                List(SortState.allCases, id: \.self) { choice in
                    HStack {
                        Text(choice.rawValue)
                        
                        Rectangle()
                            .foregroundStyle(.background)
                        
                        if choice == sortState {
                            Image(systemName: Constants.FilterSortSheet.systemImage)
                                .foregroundStyle(.green)
                        }
                    }
                    .onTapGesture {
                        sortState = choice
                        showSheet = false
                    }
                    .accessibilityAddTraits(.isButton)
                }
                .listStyle(.inset)
            case .filter:
                Text(Constants.FilterSortSheet.filterTitle)
                    .font(.headline)
                
                List(FilterState.allCases, id: \.self) { choice in
                    HStack {
                        Text(choice.rawValue)
                        
                        Rectangle()
                            .foregroundStyle(.background)
                        
                        if choice == filterState {
                            Image(systemName: Constants.FilterSortSheet.systemImage)
                                .foregroundStyle(.green)
                        }
                    }
                    .onTapGesture {
                        filterState = choice
                        showSheet = false
                    }
                    .accessibilityAddTraits(.isButton)
                }
                .listStyle(.inset)
            }
        }
        .padding(.top)
        .presentationDetents([.fraction(detentHeightFraction)])
    }
}

#Preview {
    FilterSortSheet(sheetType: .sort, sortState: .constant(.alphabetical), filterState: .constant(.hasSource), showSheet: .constant(true))
}

enum SheetType {
    case sort
    case filter
}
