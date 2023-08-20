//
//  NewWorksList.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/19/23.
//

import SwiftUI

struct NewWorksList: View {
    @Binding var iconSize: CGFloat
    
    var body: some View {
        Section {
            VStack {
                HStack {
                    Image("RemixIcon/System/loader-2-line")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                    Text("What's New")
                        .font(.custom("JosefinSans-SemiBold", size: 24))
                        .offset(y: 2)
                    Spacer()
                    ZStack {
                        Image("RemixIcon/Arrows/arrow-right-s-line")
                            .resizable()
                            .frame(width: iconSize, height: iconSize)
                    }
                }
                .padding(.leading)
                .padding(.trailing)
                .padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 10.0) {
                        ForEach(0..<3) { i in
                            VStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.gray.opacity(0.25))
                                    .frame(width: 350, height: 125)
                                
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.gray.opacity(0.25))
                                    .frame(width: 350, height: 125)
                            }
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .safeAreaPadding(.horizontal)
            }
        }
    }
}
