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
    let brightnessButtonSize = 84.0
    
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
                    VStack(alignment: .center) {
                        Image("RemixIcon/Weather/sun-line")
                        Text("Lights On")
                            .textCase(.uppercase)
                            .font(.caption)
                            .bold()
                    }
                    .frame(width: brightnessButtonSize, height: brightnessButtonSize)
                    .background(
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill((userSettings.storedDarkMode == "light" ? Color(userSettings.theme.accent) : Color.clear))
                    )
                    .foregroundStyle(userSettings.storedDarkMode == "light" ? Color.white : Color.text)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.secondary, lineWidth: 2)
                    )
                    .onTapGesture {
                        userSettings.storedDarkMode = "light"
                    }
                    
                    VStack(alignment: .center) {
                        Image("RemixIcon/Weather/moon-line")
                        Text("Lights Off")
                            .textCase(.uppercase)
                            .font(.caption)
                            .bold()
                    }
                    .frame(width: brightnessButtonSize, height: brightnessButtonSize)
                    .background(
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill((userSettings.storedDarkMode == "dark" ? Color(userSettings.theme.accent) : Color.clear))
                    )
                    .foregroundStyle(userSettings.storedDarkMode == "dark" ? Color.white : Color.text)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.secondary, lineWidth: 2)
                    )
                    .onTapGesture {
                        userSettings.storedDarkMode = "dark"
                    }
                    
                    VStack(alignment: .center) {
                        Image("RemixIcon/Device/computer-line")
                        Text("System")
                            .textCase(.uppercase)
                            .font(.caption)
                            .bold()
                    }
                    .frame(width: brightnessButtonSize, height: brightnessButtonSize)
                    .foregroundStyle(userSettings.storedDarkMode == "nil" ? Color.white : Color.text)
                    .background(
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill((userSettings.storedDarkMode == "nil" ? Color(userSettings.theme.accent) : Color.clear))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.secondary, lineWidth: 2)
                    )
                    .onTapGesture {
                        userSettings.storedDarkMode = "nil"
                    }
                    
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
    
    func toggleDarkMode(_ darkMode: String) -> () -> Void {
        return {
            userSettings.storedDarkMode = darkMode
        }
    }
}
