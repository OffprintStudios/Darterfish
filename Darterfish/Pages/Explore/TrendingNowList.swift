//
//  TrendingNowList.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/19/23.
//

import SwiftUI

struct TrendingNowList: View {
    @Binding var iconSize: CGFloat
    
    var body: some View {
        Section {
            VStack {
                HStack {
                    Image("RemixIcon/Weather/fire-line")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                    Text("Trending Now")
                        .font(.custom("JosefinSans-SemiBold", size: 24))
                        .offset(y: 2)
                    Spacer()
                    ZStack {
                        Image("RemixIcon/Arrows/arrow-right-s-line")
                            .resizable()
                            .frame(width: iconSize, height: iconSize)
                    }
                }
                
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.gray.opacity(0.25))
                    .frame(height: 125)
                
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.gray.opacity(0.25))
                    .frame(height: 125)
            }
        }
        .padding()
    }
}
