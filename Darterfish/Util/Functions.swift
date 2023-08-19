//
//  Functions.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/16/23.
//

import Foundation
import AlertKit
import SwiftUI

func copyToClipboard(_ str: String) -> () -> Void {
    return {
        UIPasteboard.general.string = str
        AlertKitAPI.present(
            title: "Copied",
            icon: .done,
            style: .iOS17AppleMusic,
            haptic: .success
        )
    }
}

func getDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    return decoder
}
