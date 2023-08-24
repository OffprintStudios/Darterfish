//
//  WorkTitleBlock.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/22/23.
//

import SwiftUI

struct WorkTitleBlock: View {
    @EnvironmentObject var userSettings: UserSettings
    @Binding var work: Work
    
    var body: some View {
        Section {
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 0) {
                    switch work.category {
                    case .fanwork:
                        let firstFandom = work.tags.first(where: { $0.kind == .fandom })
                        if firstFandom != nil {
                            Text("\(firstFandom!.parent != nil ? firstFandom!.parent!.name.uppercased() : firstFandom!.name.uppercased())")
                                .font(.system(size: 12, weight: .bold))
                                .lineLimit(1)
                                .truncationMode(.tail)
                        } else {
                            Text(work.category.rawValue.uppercased())
                                .font(.system(size: 12, weight: .bold))
                        }
                    case .original:
                        Text(work.category.rawValue.uppercased())
                            .font(.system(size: 12, weight: .bold))
                    }
                    
                    Text("•")
                        .padding(.leading, 1)
                        .padding(.trailing, 1)
                        .offset(y: -1)
                    
                    let firstGenre = work.tags.first(where: { $0.kind == .genre })!
                    Text(firstGenre.name.uppercased())
                        .font(.system(size: 12, weight: .bold))
                }
                
                Text(work.title)
                    .font(.custom("JosefinSans-SemiBold", size: 28))
                    .foregroundStyle(Color(userSettings.theme.accent))
                    .padding(.top, 0.85)
                    .padding(.bottom, 0.75)
                
                HStack {
                    Text("by \(work.author.username)")
                        .font(.custom("JosefinSans-Regular", size: 18))
                        .foregroundStyle(Color.secondary)
                    Spacer()
                }
                .padding(.bottom, 2)
                
                HStack(spacing: 0) {
                    HStack {
                        Image("RemixIcon/Business/line-chart-line")
                            .resizable()
                            .frame(width: 18, height: 18)
                        Text("\(work.views.formatUsingAbbrevation())")
                            .font(.custom("JosefinSans-Regular", size: 14))
                    }
                    
                    Text("•")
                        .font(.system(size: 16))
                        .padding(.leading, 1)
                        .padding(.trailing, 1)
                        .offset(y: -1)
                    
                    HStack {
                        Image("RemixIcon/Design/pen-nib-line")
                            .resizable()
                            .frame(width: 18, height: 18)
                        Text("\(work.words.formatUsingAbbrevation())")
                            .font(.custom("JosefinSans-Regular", size: 14))
                    }
                }
                .foregroundStyle(Color.secondary)
            }
            .padding(.leading)
            .padding(.trailing)
        }
    }
}
