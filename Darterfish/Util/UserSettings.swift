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
    @AppStorage("colorScheme") var storedBrightness = "none" {
        didSet {
            updateBrightness()
        }
    }
    
    /* Published Properties */
    @Published var theme: Theme = Crimson()
    @Published var colorScheme: ColorScheme? = .light
    
    /* Other Properties */
    
    /* Functions */
    func updateTheme() {
        theme = ThemeManager.getTheme(storedTheme)
    }
    
    func updateBrightness() {
        colorScheme = if storedBrightness == "light" {
            .light
        } else if storedBrightness == "dark" {
            .dark
        } else {
            nil
        }
    }
    
    /* Initialization */
    init() {
        updateTheme()
        updateBrightness()
    }
}
