//
//  BackButton.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/16/23.
//

import SwiftUI

struct BackButton: ToolbarContent {
    @Environment(\.dismiss) var dismiss
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigation) {
            HStack(spacing: 0) {
                Image("RemixIcon/Arrows/arrow-left-s-line")
                Text("Back")
                    .font(.custom("JosefinSans-Regular", size: 18.0))
                    .offset(y: 2)
            }
            .foregroundStyle(ThemeManager.shared.getTheme().accent)
            .onTapGesture {
                dismiss()
            }
        }
    }
}
