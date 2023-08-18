//
//  ContentView.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/15/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userSettings: UserSettings
    @State private var isSheetPresented = false
    @State private var currTabPage = Tabs.explore
    
    init() {
        let appear = UINavigationBarAppearance()
        let attersLarge: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "JosefinSans-SemiBold", size: 42)!
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
        VStack(spacing: 0) {
            NavigationStack {
                if currTabPage == .explore {
                    ZStack {
                        Color("BackgroundColor").ignoresSafeArea()
                        ExplorePage()
                            .navigationTitle("Explore")
                            .navigationBarTitleDisplayMode(.large)
                            .toolbar { TopBarItems() }
                    }
                } else if currTabPage == .social {
                    ZStack {
                        Color("BackgroundColor").ignoresSafeArea()
                        SocialPage()
                            .navigationTitle("Social")
                            .navigationBarTitleDisplayMode(.large)
                    }
                } else if currTabPage == .library {
                    ZStack {
                        Color("BackgroundColor").ignoresSafeArea()
                        LibraryPage()
                            .navigationTitle("Library")
                            .navigationBarTitleDisplayMode(.large)
                    }
                } else if currTabPage == .activity {
                    ZStack {
                        Color("BackgroundColor").ignoresSafeArea()
                        ActivityPage()
                    }
                }
            }
            
            TabNav(currTab: $currTabPage)
        }
        .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("OpenUserSheet")), perform: { _ in
            isSheetPresented = true
        })
        .sheet(isPresented: $isSheetPresented) {
            UserSheet(isPresented: $isSheetPresented)
                .preferredColorScheme(userSettings.darkMode)
        }
        .preferredColorScheme(userSettings.darkMode)
    }
}

#Preview {
    ContentView()
        .environmentObject(UserSettings())
}
