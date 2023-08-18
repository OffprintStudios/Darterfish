//
//  ThemesPanel.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/16/23.
//

import SwiftUI

struct ThemesPanel: View {
    @EnvironmentObject private var userSettings: UserSettings
    @Binding var iconSize: CGFloat
    @Binding var fontSize: CGFloat
    @Binding var fontOffset: CGFloat
    @State var selectedTheme = "crimson"
    
    var body: some View {
        List {
            Section("Accent Color") {
                VStack {
                    HStack(alignment: .center, spacing: 25) {
                        Circle()
                            .stroke(Color.white, lineWidth: 5)
                            .fill(Color(userSettings.theme.accentDark).shadow(.drop(color: .black, radius: 5)))
                            .frame(width: 75, height: 75)
                        Circle()
                            .stroke(Color.white, lineWidth: 5)
                            .fill(Color(userSettings.theme.accent).shadow(.drop(color: .black, radius: 5)))
                            .frame(width: 75, height: 75)
                        Circle()
                            .stroke(Color.white, lineWidth: 5)
                            .fill(Color(userSettings.theme.accentLight).shadow(.drop(color: .black, radius: 5)))
                            .frame(width: 75, height: 75)
                    }
                    .padding(.top)
                    
                    Picker("Color", selection: $selectedTheme) {
                        ForEach(0..<ThemeManager.themes.count) { idx in
                            Text(ThemeManager.themes[idx].name.capitalized)
                                .font(.custom("JosefinSans-Regular", size: 24.0))
                                .offset(y: 2.0)
                                .tag(ThemeManager.themes[idx].name)
                        }
                    }
                    .frame(height: 125)
                    .clipped()
                    .pickerStyle(.wheel)
                    .onChange(of: selectedTheme) {
                        userSettings.storedTheme = selectedTheme
                    }
                }
            }
            Section("Brightness") {
                HStack(alignment: .center, spacing: 15) {
                    Spacer()
                    Button(action: { userSettings.storedBrightness = "light" }) {
                        VStack(alignment: .center) {
                            Image("RemixIcon/Weather/sun-line")
                            Text("Lights On")
                                .textCase(.uppercase)
                                .font(.caption)
                                .bold()
                        }
                    }
                    .frame(width: 75, height: 75)
                    .foregroundStyle(Color.white)
                    
                    Button(action: { userSettings.storedBrightness = "dark" }) {
                        VStack(alignment: .center) {
                            Image("RemixIcon/Weather/moon-line")
                            Text("Lights Off")
                                .textCase(.uppercase)
                                .font(.caption)
                                .bold()
                        }
                    }
                    .frame(width: 75, height: 75)
                    .foregroundStyle(Color.white)
                    
                    Divider()
                    Button(action: { userSettings.storedBrightness = "none" }) {
                        VStack(alignment: .center) {
                            Image("RemixIcon/Device/computer-line")
                            Text("System")
                                .textCase(.uppercase)
                                .font(.caption)
                                .bold()
                        }
                    }
                    .frame(width: 75, height: 75)
                    .foregroundStyle(Color.white)
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar { BackButton() }
        .onAppear() {
            selectedTheme = (ThemeManager.getTheme(userSettings.theme.name)).name
        }
    }
}
