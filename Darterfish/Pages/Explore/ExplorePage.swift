//
//  ExplorePage.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/15/23.
//

import Foundation
import SwiftUI
import ShuffleIt
import SwiftUIIntrospect
import AlertKit

struct ExplorePage: View {
    @EnvironmentObject var userSettings: UserSettings
    @State private var idx = 0
    @State private var scrollOffset: CGFloat = .zero
    @State private var newsPosts: Paginate<Blog> = .init(items: [], metadata: .init(page: 1, per: 6, total: 0))
    let iconSize = 30.0
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    Color("BackgroundColor").ignoresSafeArea()
                    VStack {
                        Section {
                            GeometryReader { proxy in
                                TabView(selection: $idx) {
                                    ForEach(0..<newsPosts.items.count, id: \.self) { idx in
                                        AsyncImage(url: URL(string: newsPosts.items[idx].bannerArt ?? "https://images.offprint.net/blog-banners/default_placeholder.jpg")) { phase in
                                            if let image = phase.image {
                                                image
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: proxy.size.width, height: proxy.size.height + 100)
                                                    .clipShape(Rectangle())
                                                    .background(Color.black)
                                                    .overlay(alignment: .bottom) {
                                                        VStack {
                                                            HStack {
                                                                Text(newsPosts.items[idx].title)
                                                                    .font(.custom("JosefinSans-SemiBold", size: 24))
                                                            }
                                                            .offset(y: -12)
                                                        }
                                                        .frame(width: proxy.size.width, height: proxy.size.height / 3)
                                                        .background(.thinMaterial.opacity(0.5))
                                                    }
                                            } else if phase.error != nil {
                                                Color.red
                                                Image("RemixIcon/System/close-circle-line")
                                                    .foregroundStyle(Color.white)
                                            } else {
                                                ZStack {
                                                    Color.gray
                                                    Image("RemixIcon/Media/image-line")
                                                }
                                            }
                                        }
                                    }
                                }
                                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                                .ignoresSafeArea(.all)
                                .clipped()
                                .frame(width: proxy.size.width, height: proxy.size.height + 100)
                                .offset(y: -100)
                                .introspect(.scrollView, on: .iOS(.v13, .v14, .v15, .v16, .v17)) { scrollView in
                                    scrollView.bounces = false
                                    scrollView.clipsToBounds = false
                                }
                            }
                        }
                        .frame(height: 250)
                        .task {
                            do {
                                let result = try await getNewsPosts()
                                if result != nil {
                                    newsPosts = result!
                                }
                            } catch {
                                print("Error: \(error)")
                            }
                        }
                        
                        Section {
                            VStack {
                                HStack {
                                    Image("RemixIcon/System/loader-2-line")
                                        .resizable()
                                        .frame(width: iconSize, height: iconSize)
                                    Text("What's New")
                                        .font(.custom("JosefinSans-SemiBold", size: 24))
                                        .offset(y: 2)
                                    Spacer()
                                    ZStack {
                                        Image("RemixIcon/Arrows/arrow-right-s-line")
                                            .resizable()
                                            .frame(width: iconSize, height: iconSize)
                                    }
                                }
                                
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.gray.opacity(0.25))
                                    .frame(height: 250)
                            }
                        }
                        .padding()
                        
                        Section {
                            VStack {
                                HStack {
                                    Image("RemixIcon/Map/signal-tower-line")
                                        .resizable()
                                        .frame(width: iconSize, height: iconSize)
                                    Text("Recently Updated")
                                        .font(.custom("JosefinSans-SemiBold", size: 24))
                                        .offset(y: 2)
                                    Spacer()
                                    ZStack {
                                        Image("RemixIcon/Arrows/arrow-right-s-line")
                                            .resizable()
                                            .frame(width: iconSize, height: iconSize)
                                    }
                                }
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.gray.opacity(0.25))
                                    .frame(height: 250)
                            }
                        }
                        .padding()
                        
                        Spacer()
                    }
                    GeometryReader { geo in
                        let offset = geo.frame(in: .named("scroll")).minY
                        Color.clear.preference(key: ExploreViewOffsetPreferenceKey.self, value: offset)
                    }
                }
            }
            .introspect(.scrollView, on: .iOS(.v13, .v14, .v15, .v16, .v17)) { scrollView in
                scrollView.bounces = false
            }
            .coordinateSpace(name: "scroll")
            .onPreferenceChange(ExploreViewOffsetPreferenceKey.self) { value in
                scrollOffset = value * -1.0
            }
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
