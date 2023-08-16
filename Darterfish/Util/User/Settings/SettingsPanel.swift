//
//  SettingsPanel.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/16/23.
//

import SwiftUI

struct SettingsPanel: View {
    @Binding var iconSize: CGFloat
    @Binding var fontSize: CGFloat
    @Binding var fontOffset: CGFloat
    
    var body: some View {
        NavigationStack {
            List {
                Section("General") {
                    ZStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            Image("RemixIcon/System/information-line")
                                .resizable()
                                .frame(width: iconSize, height: iconSize)
                            VStack {
                                Text("About")
                                    .font(.custom("JosefinSans-Regular", size: fontSize))
                                    .offset(y: fontOffset)
                            }
                        }
                        NavigationLink(destination: AboutPanel(iconSize: $iconSize, fontSize: $fontSize, fontOffset: $fontOffset)) {
                            EmptyView()
                        }
                    }
                    ZStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            Image("RemixIcon/Map/earth-line")
                                .resizable()
                                .frame(width: iconSize, height: iconSize)
                            VStack {
                                Text("Localization")
                                    .font(.custom("JosefinSans-Regular", size: fontSize))
                                    .offset(y: fontOffset)
                            }
                        }
                        NavigationLink(destination: LocalizationPanel()) {
                            EmptyView()
                        }
                    }
                    ZStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            Image("RemixIcon/System/filter-line")
                                .resizable()
                                .frame(width: iconSize, height: iconSize)
                            VStack {
                                Text("Filters")
                                    .font(.custom("JosefinSans-Regular", size: fontSize))
                                    .offset(y: fontOffset)
                            }
                        }
                        NavigationLink(destination: FiltersPanel()) {
                            EmptyView()
                        }
                    }
                    ZStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            Image("RemixIcon/Design/palette-line")
                                .resizable()
                                .frame(width: iconSize, height: iconSize)
                            VStack {
                                Text("Themes")
                                    .font(.custom("JosefinSans-Regular", size: fontSize))
                                    .offset(y: fontOffset)
                            }
                        }
                        NavigationLink(destination: ThemesPanel()) {
                            EmptyView()
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar { BackButton() }
    }
}
