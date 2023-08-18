//
//  BackButton.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/16/23.
//

import SwiftUI

struct BackButton: ToolbarContent {
    @EnvironmentObject var userSettings: UserSettings
    @Environment(\.dismiss) var dismiss
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigation) {
            HStack(spacing: 0) {
                Image("RemixIcon/Arrows/arrow-left-s-line")
                    .resizable()
                    .frame(width: 22.0, height: 22.0)
                Text("Back")
                    .font(.custom("JosefinSans-Regular", size: 18.0))
                    .offset(y: 2)
            }
            .offset(x: -8)
            .foregroundStyle(Color(userSettings.theme.accent))
            .onTapGesture {
                dismiss()
            }
        }
    }
}
