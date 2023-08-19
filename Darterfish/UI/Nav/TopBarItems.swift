//
//  TopBarItems.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/15/23.
//

import SwiftUI

struct TopBarItems: ToolbarContent {
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            HStack {                
                Button(action: openSearch) {
                    Image("RemixIcon/System/search-eye-line")
                        .resizable()
                        .frame(width: 30.0, height: 30.0)
                        .foregroundStyle(Color("TextColor"))
                }
            }
        }
    }
    
    func openMessages() {
        print("Messages Open")
    }
    
    func openSearch() {
        print("Search Open")
    }
}
