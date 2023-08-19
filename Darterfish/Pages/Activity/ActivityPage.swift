//
//  ActivityPage.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/17/23.
//

import SwiftUI

struct ActivityPage: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            VStack {
                Image("RemixIcon/Media/notification-2-line")
                Text("Activity Page")
                    .font(Font.custom("JosefinSans-Regular", size: 18))
            }
            .padding()
        }
    }
}
