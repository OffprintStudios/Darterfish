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

func pluralize(_ value: Int64, suffix: String? = nil) -> String {
    if suffix != nil {
        if value == 0 || value > 1 {
            return suffix!
        }
    } else if value == 0 || value > 1 {
        return "s"
    }
    
    return ""
}

func getTotalPages(perPage: Int64, total: Int64) -> Int64 {
    let totalPages = floor(Double(total) / Double(perPage))
    return totalPages == 0 ? 1 : Int64(totalPages)
}
