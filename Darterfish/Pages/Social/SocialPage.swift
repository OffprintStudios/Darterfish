//
//  SocialPage.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/15/23.
//

import SwiftUI

struct SocialPage: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundColor").ignoresSafeArea()
                VStack {
                    Image("RemixIcon/UserAndFaces/team-line")
                    Text("Social Page")
                        .font(Font.custom("JosefinSans-Regular", size: 18))
                }
                .padding()
                .navigationTitle("Social")
                .navigationBarTitleDisplayMode(.large)
            }
        }
    }
}
