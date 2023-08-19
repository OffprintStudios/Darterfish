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
    @State private var tabState = TabNav.TabState(currTab: .explore, transitionIsForward: true)
    
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
            Group {
                if tabState.currTab == .explore {
                    ExplorePage()
                } else if tabState.currTab == .social {
                    SocialPage()
                } else if tabState.currTab == .library {
                    LibraryPage()
                } else if tabState.currTab == .activity {
                    ActivityPage()
                }
            }
            .transition(.dynamicSlide(forward: $tabState.transitionIsForward))
            .animation(.default, value: tabState.currTab)
            
            TabNav(tabState: $tabState)
        }
        
        .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("OpenUserSheet")), perform: { _ in
            isSheetPresented = true
        })
        .sheet(isPresented: $isSheetPresented) {
            UserSheet(isPresented: $isSheetPresented)
                .preferredColorScheme(userSettings.darkMode)
        }
        .preferredColorScheme(userSettings.darkMode)
        .background(Color("BackgroundColor"))
    }
}

#Preview {
    ContentView()
        .environmentObject(UserSettings())
}
