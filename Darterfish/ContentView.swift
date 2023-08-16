//
//  ContentView.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/15/23.
//

import SwiftUI

struct ContentView: View {
    @State private var theme = ThemeManager.shared.getTheme()
    @State private var isSheetPresented = false
    
    init() {
        let appear = UINavigationBarAppearance()
        let attersLarge: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "JosefinSans-SemiBold", size: 42)!,
            .foregroundColor: UIColor(theme.accent)
        ]
        let attersSmall: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "JosefinSans-Regular", size: 20)!
        ]
        appear.largeTitleTextAttributes = attersLarge
        appear.titleTextAttributes = attersSmall
        
        UINavigationBar.appearance().standardAppearance = appear
        UINavigationBar.appearance().compactAppearance = appear
    }
    
    var body: some View {
        TabView {
            NavigationView {
                ZStack {
                    Color("BackgroundColor").ignoresSafeArea()
                    ExplorePage()
                        .navigationTitle("Explore")
                        .navigationBarTitleDisplayMode(.large)
                        .toolbar { TopBarItems() }
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
                        .navigationTitle("Social")
                        .navigationBarTitleDisplayMode(.large)
                        .toolbar { TopBarItems() }
                }
            }.tabItem {
                Image("RemixIcon/UserAndFaces/team-line")
                Text("Social")
            }
            
            NavigationView {
                ZStack {
                    Color("BackgroundColor").ignoresSafeArea()
                    LibraryPage()
                        .navigationTitle("Library")
                        .navigationBarTitleDisplayMode(.large)
                        .toolbar { TopBarItems() }
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
        .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("OpenUserSheet")), perform: { _ in
            isSheetPresented = true
        })
        .tint(.white)
        .sheet(isPresented: $isSheetPresented) {
            UserSheet(isPresented: $isSheetPresented)
        }
    }
}

#Preview {
    ContentView()
}
