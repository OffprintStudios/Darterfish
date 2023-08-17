//
//  UserSettings.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/16/23.
//

import Foundation
import SwiftUI

class UserSettings: ObservableObject {
    @Published var theme: Theme = CrimsonTheme()
    
    func setTheme(_ newTheme: Theme) {
        print("Setting new theme")
        theme = newTheme
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
        
        UITabBar.appearance().backgroundColor = UIColor(theme.accent)
        UITabBar.appearance().unselectedItemTintColor = UIColor(theme.accentLight)
    }
}

extension UserSettings {
    enum ThemesList: String, CaseIterable, Identifiable {
        case crimson, aqua, royal, autumn, field
        var id: Self { self }
    }
}
