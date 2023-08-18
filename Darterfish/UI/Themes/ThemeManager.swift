//
//  ThemeManager.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/15/23.
//

import Foundation

enum ThemeManager {
    static let themes: [Theme] = [Crimson(), Aqua(), Royal(), Autumn(), Field()]
    
    static func getTheme(_ theme: String) -> Theme {
        Self.themes.first(where: { $0.name == theme })!
    }
}
