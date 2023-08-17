//
//  ContentView.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/15/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var userSettings = UserSettings()
    @State private var isSheetPresented = false
    
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
        .environmentObject(userSettings)
        .onAppear() {
            self.userSettings.setTheme(CrimsonTheme())
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
