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
                Button(action: openMessages) {
                    Image("RemixIcon/Communication/question-answer-line")
                        .resizable()
                        .frame(width: 26.0, height: 26.0)
                        .foregroundStyle(Color("TextColor"))
                }
                
                Button(action: openActivity) {
                    Image("RemixIcon/Media/notification-2-line")
                        .resizable()
                        .frame(width: 26.0, height: 26.0)
                        .foregroundStyle(Color("TextColor"))
                }
                
                Button(action: openUser) {
                    Image("RemixIcon/UserAndFaces/user-5-line")
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
    
    func openActivity() {
        print("Activity Open")
    }
    
    func openUser() {
        NotificationCenter.default.post(name: NSNotification.Name("OpenUserSheet"), object: nil)
    }
}
