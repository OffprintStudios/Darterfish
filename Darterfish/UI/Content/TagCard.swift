//
//  TagCard.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/20/23.
//

import SwiftUI

struct TagCard: View {
    @Binding var tagInfo: Tag.FetchTag
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                Group {
                    VStack(alignment: .center) {
                        let hasIcon = TagIconStrings.keys.contains(where: { $0 == tagInfo.tag.name })
                        if hasIcon {
                            Image(TagIconStrings[tagInfo.tag.name]!)
                                .resizable()
                                .frame(width: 42, height: 42)
                        }
                        Text(tagInfo.tag.name.uppercased())
                            .font(.system(size: 12, weight: .bold))
                    }
                }
                .padding(.top)
                .padding(.bottom)
                .frame(width: geo.size.width, height: geo.size.height)
                .background(Color.gray.opacity(0.25))
                .clipped()
            }
        }
        .clipped()
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .frame(width: 100)
    }
}
