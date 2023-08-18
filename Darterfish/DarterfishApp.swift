//
//  DarterfishApp.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/15/23.
//

import SwiftUI

@main
struct DarterfishApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(UserSettings())
        }
    }
}
