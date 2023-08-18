//
//  UserSettings.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/16/23.
//

import SwiftUI

class UserSettings: ObservableObject {
    /* Stored Properties */
    @AppStorage("theme") var storedTheme = "crimson" {
        didSet {
            updateTheme()
        }
    }
    @AppStorage("darkMode") var storedDarkMode = "nil" {
        didSet {
            updateDarkMode()
        }
    }
    
    /* Published Properties */
    @Published var theme: Theme = Crimson()
    @Published var darkMode: ColorScheme? = nil
    
    /* Other Properties */
    
    /* Functions */
    func updateTheme() {
        theme = ThemeManager.getTheme(storedTheme)
    }
    
    func updateDarkMode() {
        switch storedDarkMode {
        case "light":
            darkMode = .light
            break
        case "dark":
            darkMode = .dark
            break
        default:
            darkMode = nil
            break
        }
    }
    
    /* Initialization */
    init() {
        updateTheme()
        updateDarkMode()
    }
}
