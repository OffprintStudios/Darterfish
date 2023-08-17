//
//  AquaTheme.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/15/23.
//

import SwiftUI

final class AquaTheme: Theme {
    static var name = "Aqua"
    var accent = Color(
        .sRGB,
        red: 98 / 255,
        green: 150 / 255,
        blue: 209 / 255
    )
    var accentDark = Color(
        .sRGB,
        red: 64 / 255,
        green: 98 / 255,
        blue: 136 / 255
    )
    var accentLight = Color(
        .sRGB,
        red: 152 / 255,
        green: 187 / 255,
        blue: 224 / 255
    )
}
