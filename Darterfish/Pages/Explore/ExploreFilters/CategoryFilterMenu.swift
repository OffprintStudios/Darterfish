//
//  CategoryFilterMenu.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/21/23.
//

import SwiftUI

struct CategoryFilterMenu: View {
    @Binding var currCategory: ExploreFilters.Categories
    
    var body: some View {
        Menu {
            Button(action: { currCategory = .newest }) {
                Image("RemixIcon/System/loader-2-line")
                Text("Newest")
            }
            Button(action: { currCategory = .updated }) {
                Image("RemixIcon/Map/signal-tower-line")
                Text("Updated")
            }
        } label: {
            HStack(spacing: 2) {
                switch currCategory {
                case .newest:
                    Image("RemixIcon/System/loader-2-line")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .padding(.trailing, 5)
                case .updated:
                    Image("RemixIcon/Map/signal-tower-line")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .padding(.trailing, 5)
                }
                Text(currCategory.rawValue.uppercased())
                    .font(.system(size: 14, weight: .bold))
            }
            .padding(.leading)
            .padding(.top)
            .padding(.bottom)
            .padding(.trailing, 17)
        }
    }
}
