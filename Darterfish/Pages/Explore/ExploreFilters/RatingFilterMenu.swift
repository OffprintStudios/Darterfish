//
//  RatingFilterMenu.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/21/23.
//

import SwiftUI

struct RatingFilterMenu: View {
    @Binding var currRating: ExploreFilters.Ratings
    
    var body: some View {
        Menu {
            Button(action: { currRating = .all }) {
                Image("RemixIcon/Weather/shining-2-line")
                Text("All Ratings")
            }
            Button(action: { currRating = .everyone }) {
                Image("RemixIcon/Weather/sun-line")
                Text("Everyone")
            }
            Button(action: { currRating = .teen }) {
                Image("RemixIcon/Weather/cloudy-line")
                Text("Teen")
            }
            Button(action: { currRating = .mature }) {
                Image("RemixIcon/Weather/moon-foggy-line")
                Text("Mature")
            }
            Button(action: { currRating = .explicit }) {
                Image("RemixIcon/Weather/moon-line")
                Text("Explicit")
            }
        } label: {
            HStack(spacing: 2) {
                switch currRating {
                case .all:
                    Image("RemixIcon/Weather/shining-2-line")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .padding(.trailing, 5)
                case .everyone:
                    Image("RemixIcon/Weather/sun-line")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .padding(.trailing, 5)
                case .teen:
                    Image("RemixIcon/Weather/cloudy-line")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .padding(.trailing, 5)
                case .mature:
                    Image("RemixIcon/Weather/moon-foggy-line")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .padding(.trailing, 5)
                case .explicit:
                    Image("RemixIcon/Weather/moon-line")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .padding(.trailing, 5)
                }
                Text(currRating.rawValue.uppercased())
                    .font(.system(size: 12, weight: .bold))
            }
            .padding(.leading, 15)
            .padding(.top)
            .padding(.bottom)
            .padding(.trailing, 15)
        }
    }
}
