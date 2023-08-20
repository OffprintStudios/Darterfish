//
//  ExploreCarousel.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/19/23.
//

import SwiftUI
import SwiftUIIntrospect

struct ExploreCarousel: View {
    @EnvironmentObject var userSettings: UserSettings
    @State private var idx = 0
    @State private var newsPosts: Paginate<Blog> = .init(items: [], metadata: .init(page: 1, per: 6, total: 0))
    
    var body: some View {
        Section {
            GeometryReader { proxy in
                TabView(selection: $idx) {
                    ForEach(0..<newsPosts.items.count, id: \.self) { idx in
                        AsyncImage(url: URL(string: newsPosts.items[idx].bannerArt ?? "https://images.offprint.net/blog-banners/default_placeholder.jpg")) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: proxy.size.width, height: proxy.size.height + 150)
                                    .clipShape(Rectangle())
                                    .background(Color.black)
                                    .overlay(alignment: .bottom) {
                                        VStack {
                                            HStack {
                                                Text(newsPosts.items[idx].title)
                                                    .font(.custom("JosefinSans-SemiBold", size: 24))
                                                    .foregroundStyle(Color.white)
                                                    .multilineTextAlignment(.center)
                                                    .padding(.leading)
                                                    .padding(.trailing)
                                            }
                                            .offset(y: -12)
                                        }
                                        .frame(width: proxy.size.width, height: proxy.size.height * 0.4)
                                        .background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom))
                                    }
                            } else if phase.error != nil {
                                Image("RemixIcon/System/close-circle-line")
                                    .resizable()
                                    .frame(width: 75, height: 75)
                                    .foregroundStyle(Color.white)
                            } else {
                                ZStack {
                                    Image("RemixIcon/Media/image-line")
                                        .resizable()
                                        .frame(width: 75, height: 75)
                                        .foregroundStyle(Color.white)
                                }
                            }
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .ignoresSafeArea(.all)
                .clipped()
                .frame(width: proxy.size.width, height: proxy.size.height + 150)
                .background(Color(userSettings.theme.accent))
                .offset(y: -150)
                .introspect(.scrollView, on: .iOS(.v13, .v14, .v15, .v16, .v17)) { scrollView in
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
    }
}
