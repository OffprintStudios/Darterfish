//
//  WorkCoverArtBlock.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/22/23.
//

import SwiftUI

struct WorkCoverArtBlock: View {
    @Binding var work: Work
    
    var body: some View {
        Section {
            HStack(alignment: .bottom) {
                if let coverArt = work.coverArt {
                    AsyncImage(url: URL(string: coverArt)!) { phase in
                        if let image = phase.image {
                            VStack {
                                Spacer()
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .clipped()
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            }
                            .frame(width: 160, height: 256)
                        }
                    }
                } else {
                    Color.clear
                        .frame(width: 160, height: 256)
                }
                HStack {
                    Spacer()
                    
                    HStack {
                        Button(action: toggleLike) {
                            Image("RemixIcon/System/thumb-up-line")
                                .resizable()
                                .frame(width: 18, height: 18)
                            Text("\(work.likes.formatUsingAbbrevation())")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .padding(.trailing, 10)
                        .foregroundStyle(Color.green)
                        
                        Button(action: toggleDislike) {
                            Image("RemixIcon/System/thumb-down-line")
                                .resizable()
                                .frame(width: 18, height: 18)
                            Text("\(work.dislikes.formatUsingAbbrevation())")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .foregroundStyle(Color.red)
                    }
                    .padding(10)
                    .background(Color.gray.opacity(0.25))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
            .padding(.top, 100)
            .padding(.leading)
            .padding(.trailing)
            .padding(.bottom)
        }
    }
}

extension WorkCoverArtBlock {
    func toggleLike() {
        // TODO: implement adding likes
        print("Like: \(work.id)")
    }
    
    func toggleDislike() {
        // TODO: implement adding dislikes
        print("Dislike: \(work.id)")
    }
}
