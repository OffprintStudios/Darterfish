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
        ZStack(alignment: .bottomLeading) {
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
                        .frame(width: 180, height: 288)
                    }
                }
            } else {
                Color.clear
                    .frame(width: 125, height: 200)
            }
            HStack {
                Spacer()
                
                Button(action: { print("Like") }) {
                    Image("RemixIcon/System/thumb-up-line")
                        .resizable()
                        .frame(width: 18, height: 18)
                    Text("\(work.likes.formatUsingAbbrevation())")
                        .font(.system(size: 18, weight: .semibold))
                }
                .padding(.trailing, 5)
                .foregroundStyle(Color.green)
                
                Button(action: { print("Dislike") }) {
                    Image("RemixIcon/System/thumb-down-line")
                        .resizable()
                        .frame(width: 18, height: 18)
                    Text("\(work.dislikes.formatUsingAbbrevation())")
                        .font(.system(size: 18, weight: .semibold))
                }
                .foregroundStyle(Color.red)
            }
        }
        .frame(height: 35)
        .offset(y: -100)
    }
}
