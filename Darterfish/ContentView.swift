//
//  ContentView.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/15/23.
//

import SwiftUI

struct ContentView: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "JosefinSans-SemiBold", size: 42)!]
    }
    
    var body: some View {
        let theme = ThemeManager.shared.getTheme()
        TabView {
            NavigationView {
                ZStack {
                    Color("BackgroundColor").ignoresSafeArea()
                    ExplorePage()
                        .navigationTitle("Explore")
                        .navigationBarTitleDisplayMode(.large)
                        .toolbar {
                            ToolbarItem(placement: .topBarTrailing) {
                                HStack {
                                    Image("RemixIcon/Communication/question-answer-line")
                                        .resizable()
                                        .frame(width: 26.0, height: 26.0)
                                        .padding(.horizontal)
                                    
                                    Image("RemixIcon/UserAndFaces/user-5-line")
                                        .resizable()
                                        .frame(width: 30.0, height: 30.0)
                                }
                            }
                        }
                }
            }
            .tabItem {
                Image("RemixIcon/Map/compass-discover-line")
                Text("Explore")
            }
            
            NavigationView {
                ZStack {
                    Color("BackgroundColor").ignoresSafeArea()
                    SocialPage()
                }
            }.tabItem {
                Image("RemixIcon/UserAndFaces/team-line")
                Text("Social")
            }
            
            NavigationView {
                ZStack {
                    Color("BackgroundColor").ignoresSafeArea()
                    LibraryPage()
                }
            }.tabItem {
                Image("RemixIcon/Business/bookmark-line")
                Text("Library")
            }
            
            NavigationView {
                ZStack {
                    Color("BackgroundColor").ignoresSafeArea()
                    SearchPage()
                }
            }.tabItem {
                Image("RemixIcon/System/search-eye-line")
                Text("Search")
            }
        }
        .onAppear() {
            UITabBar.appearance().backgroundColor = UIColor(theme.accent)
            UITabBar.appearance().unselectedItemTintColor = UIColor(theme.accentLight)
        }
        .tint(.white)
    }
}

#Preview {
    ContentView()
}
