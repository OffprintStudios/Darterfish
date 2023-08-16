//
//  ThemeManager.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/15/23.
//

import Foundation

class ThemeManager {
    static let shared = ThemeManager()
    private var theme: Theme = CrimsonTheme()
    
    public func applyTheme(theme: Theme) {
        self.theme = theme
    }
    
    public func getTheme() -> Theme {
        return self.theme
    }
}
