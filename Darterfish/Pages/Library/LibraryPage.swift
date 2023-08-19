//
//  LibraryPage.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/15/23.
//

import SwiftUI

struct LibraryPage: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundColor").ignoresSafeArea()
                VStack {
                    Image("RemixIcon/Business/bookmark-line")
                    Text("Library Page")
                        .font(Font.custom("JosefinSans-Regular", size: 18))
                }
                .padding()
                .navigationTitle("Library")
                .navigationBarTitleDisplayMode(.large)
            }
        }
        
    }
}
