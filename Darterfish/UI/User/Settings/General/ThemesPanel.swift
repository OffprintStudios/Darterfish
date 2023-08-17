//
//  ThemesPanel.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/16/23.
//

import SwiftUI

struct ThemesPanel: View {
    private typealias Themes = UserSettings.ThemesList
    
    @EnvironmentObject private var userSettings: UserSettings
    @State private var selectedTheme: Themes = .crimson
    @Binding var iconSize: CGFloat
    @Binding var fontSize: CGFloat
    @Binding var fontOffset: CGFloat
    private let themes: [Theme] = [
        CrimsonTheme(),
        AquaTheme(),
        RoyalTheme(),
        AutumnTheme(),
        FieldTheme(),
    ]
    
    var body: some View {
        List {
            Section("Accent Color") {
                Picker("Color", selection: $selectedTheme) {
                    ForEach(Themes.allCases) { theme in
                        Text(theme.rawValue.capitalized)
                            .font(.custom("JosefinSans-Regular", size: 24.0))
                            .offset(y: 2.0)
                            .tag(theme)
                    }
                }
                .pickerStyle(.wheel)
                .onChange(of: selectedTheme) {
                    print(selectedTheme)
                    switch selectedTheme {
                    case .crimson:
                        self.userSettings.setTheme(CrimsonTheme())
                        break
                    case .aqua:
                        self.userSettings.setTheme(AquaTheme())
                        break
                    case .royal:
                        self.userSettings.setTheme(RoyalTheme())
                        break
                    case .autumn:
                        self.userSettings.setTheme(AutumnTheme())
                        break
                    case .field:
                        self.userSettings.setTheme(FieldTheme())
                        break
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar { BackButton() }
    }
}
