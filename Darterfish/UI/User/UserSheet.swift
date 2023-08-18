//
//  UserSheet.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/15/23.
//

import SwiftUI

struct UserSheet: View {
    @EnvironmentObject var userSettings: UserSettings
    @Binding var isPresented: Bool
    @State private var iconSize: CGFloat = 22.0
    @State private var fontSize: CGFloat = 18.0
    @State private var fontOffset: CGFloat = 3.0
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                List {
                    Section {
                        HStack(alignment: .top) {
                            Image("RemixIcon/System/login-circle-line")
                                .resizable()
                                .frame(width: iconSize, height: iconSize)
                            VStack {
                                Text("Log In")
                                    .font(.custom("JosefinSans-Regular", size: fontSize))
                                    .offset(y: fontOffset)
                            }
                        }
                        HStack(alignment: .top) {
                            Image("RemixIcon/UserAndFaces/user-add-line")
                                .resizable()
                                .frame(width: iconSize, height: iconSize)
                            VStack {
                                Text("Sign Up")
                                    .font(.custom("JosefinSans-Regular", size: fontSize))
                                    .offset(y: fontOffset)
                            }
                        }
                    }
                    Section {
                        ZStack(alignment: .leading) {
                            HStack(alignment: .top) {
                                Image("RemixIcon/System/settings-5-line")
                                    .resizable()
                                    .frame(width: iconSize, height: iconSize)
                                VStack {
                                    Text("Settings")
                                        .font(.custom("JosefinSans-Regular", size: fontSize))
                                        .offset(y: fontOffset)
                                }
                            }
                            NavigationLink(destination: SettingsPanel(iconSize: $iconSize, fontSize: $fontSize, fontOffset: $fontOffset)) {
                                EmptyView()
                            }
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Button(action: closeSheet) {
                        Image("RemixIcon/Arrows/arrow-down-s-line")
                            .resizable()
                            .frame(width: 26.0, height: 26.0)
                            .foregroundStyle(Color(userSettings.theme.accent))
                    }
                }
            }
        }
        .preferredColorScheme(userSettings.darkMode)
    }
    
    func closeSheet() {
        isPresented = false
    }
}
