//
//  TypeFilterMenu.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/21/23.
//

import SwiftUI

struct TypeFilterMenu: View {
    @Binding var currType: ExploreFilters.Types
    
    var body: some View {
        Menu {
            Button(action: { currType = .all }) {
                Image("RemixIcon/System/apps-line")
                Text("All Works")
            }
            Button(action: { currType = .original }) {
                Image("RemixIcon/Weather/sparkling-2-line")
                Text("Original")
            }
            Button(action: { currType = .fanwork }) {
                Image("RemixIcon/UserAndFaces/user-heart-line")
                Text("Fanwork")
            }
        } label: {
            HStack(spacing: 2) {
                switch currType {
                case .all:
                    Image("RemixIcon/System/apps-line")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .padding(.trailing, 5)
                case .original:
                    Image("RemixIcon/Weather/sparkling-2-line")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .padding(.trailing, 5)
                case .fanwork:
                    Image("RemixIcon/UserAndFaces/user-heart-line")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .padding(.trailing, 5)
                }
                
                Text(currType.rawValue.uppercased())
                    .font(.system(size: 12, weight: .bold))
            }
            .padding(.leading)
            .padding(.top)
            .padding(.bottom)
            .padding(.trailing, 17)
        }
    }
}
