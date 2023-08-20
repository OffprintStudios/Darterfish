//
//  ExplorePage.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/15/23.
//

import Foundation
import SwiftUI

struct ExplorePage: View {
    @EnvironmentObject var userSettings: UserSettings
    @State private var scrollOffset: CGFloat = .zero
    @State private var iconSize: CGFloat = 30.0
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    Color("BackgroundColor").ignoresSafeArea()
                    VStack {
                        ExploreCarousel()
                        // TrendingNowList(iconSize: $iconSize)
                        NewWorksList(iconSize: $iconSize)
                        RecentlyUpdatedList(iconSize: $iconSize)
                    }
                    .padding(.bottom)
                    GeometryReader { geo in
                        let offset = geo.frame(in: .named("scroll")).minY
                        Color.clear.preference(key: ExploreViewOffsetPreferenceKey.self, value: offset)
                    }
                }
            }
            .coordinateSpace(name: "scroll")
            .onPreferenceChange(ExploreViewOffsetPreferenceKey.self) { value in
                scrollOffset = value * -1.0
            }
            .background(Color("BackgroundColor"))
            .safeAreaInset(edge: .top) {
                HStack {
                    Text("Offprint")
                        .font(.custom("JosefinSans-Bold", size: 24))
                        .offset(y: 3)
                        .padding(.leading)
                        .foregroundStyle(Color.white)
                    Spacer()
                    Button(action: { print("Search") }) {
                        Image("RemixIcon/System/search-eye-line")
                            .resizable()
                            .frame(width: 28, height: 28)
                    }
                    .foregroundStyle(Color.white)
                    .padding(.trailing)
                }
                .padding(.bottom)
                .background(Color(userSettings.theme.accent).opacity(
                    scrollOffset > 0 ? (scrollOffset > 260 ? 1.0 : scrollOffset / 260) : 0
                ))
            }
        }
    }
}

extension ExplorePage {
    struct ExploreViewOffsetPreferenceKey: PreferenceKey {
        typealias Value = CGFloat
        static var defaultValue = CGFloat.zero
        static func reduce(value: inout Value, nextValue: () -> Value) {
            value += nextValue()
        }
    }
}
