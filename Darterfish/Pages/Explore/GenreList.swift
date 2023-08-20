//
//  GenreList.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/20/23.
//

import Foundation
import SwiftUI

struct GenreList: View {
    @Binding var iconSize: CGFloat
    @State private var loading = false
    @State private var tags: [Tag.FetchTag] = []
    
    var body: some View {
        Section {
            VStack(spacing: 0) {
                HStack {
                    Image("RemixIcon/Others/box-2-fill")
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                    Text("Genres")
                        .font(.custom("JosefinSans-SemiBold", size: 20))
                        .offset(y: 2)
                    Spacer()
                    ZStack {
                        Image("RemixIcon/Arrows/arrow-right-s-line")
                            .resizable()
                            .frame(width: iconSize, height: iconSize)
                    }
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    if loading {
                        LazyHStack(spacing: 10.0) {
                            ForEach(0..<1) { i in
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.gray.opacity(0.25))
                                    .frame(height: 75)
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.gray.opacity(0.25))
                                    .frame(height: 75)
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.gray.opacity(0.25))
                                    .frame(height: 75)
                            }
                        }
                        .scrollTargetLayout()
                    } else {
                        LazyHStack(spacing: 10.0) {
                            ForEach(Array(stride(from: 0, to: tags.count, by: 2)), id: \.self) { i in
                                TagCard(tagInfo: $tags[i])
                            }
                        }
                        .scrollTargetLayout()
                    }
                }
                .scrollTargetBehavior(.viewAligned)
                .safeAreaPadding(.horizontal)
            }
            .frame(height: 175)
            .padding(.top)
        }
        .task {
            do {
                loading = true
                let result = try await getGenres()
                if result != nil {
                    tags = result!
                }
                loading = false
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
