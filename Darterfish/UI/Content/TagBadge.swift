//
//  TagBadge.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/23/23.
//

import SwiftUI

struct TagBadge: View {
    @State var tag: Tag
    
    var body: some View {
        HStack(spacing: 0) {
            if tag.kind == .genre {
                Image(TagIconStrings[tag.name]!)
                    .frame(width: 14, height: 14)
                    .padding(.trailing, 10)
            }
            if let parent = tag.parent {
                Text("\(parent.name)—\(tag.name)".uppercased())
                    .font(.system(size: 13, weight: .bold))
                    
            } else {
                Text(tag.name.uppercased())
                    .font(.system(size: 13, weight: .bold))
            }
        }
        .foregroundStyle(Color.white)
        .padding(.init(top: 10, leading: 15, bottom: 10, trailing: 15))
        .frame(height: 42)
        .background(tag.kind == .genre ? Color.green : Color.gray)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
