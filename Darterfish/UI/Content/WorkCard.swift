//
//  WorkCard.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/20/23.
//

import SwiftUI

struct WorkCard: View {
    @EnvironmentObject var userSettings: UserSettings
    @Binding var work: Work
    @State var fullWidth = false
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                Color(userSettings.theme.accent)
                    .frame(width: geo.size.width, height: geo.size.height * 0.35)
                    .overlay {
                        if let bannerArt = work.bannerArt {
                            AsyncImage(url: URL(string: bannerArt)!) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .scaledToFill()
                                }
                            }
                        }
                    }
                    .clipped()
                VStack {
                    HStack {
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
                                            .offset(y: -7)
                                    }
                                    .frame(width: 100, height: 140)
                                }
                            }
                        }
                        VStack(alignment: .leading) {
                            Spacer()
                            let firstGenre = work.tags.first(where: { $0.kind == .genre })!
                            Text(firstGenre.name.uppercased())
                                .font(.system(size: 10, weight: .bold))
                            Text(work.title)
                                .font(.custom("JosefinSans-SemiBold", size: 18))
                                .padding(.top, 0.75)
                                .padding(.bottom, 0.75)
                                .lineLimit(1)
                                .truncationMode(.tail)
                            HStack {
                                Text("by \(work.author.username)")
                                    .font(.custom("JosefinSans-Regular", size: 12))
                                    .foregroundStyle(Color.secondary)
                                    .lineLimit(1)
                                    .truncationMode(.tail)
                                Spacer()
                            }
                        }
                    }
                    
                    HStack {
                        Text(work.shortDesc)
                            .font(.system(size: 12))
                            .italic()
                            .lineLimit(2)
                            .truncationMode(.tail)
                        Spacer()
                    }
                    .padding(.init(top: 0, leading: 0, bottom: 5, trailing: 0))
                    .frame(height: 42)
                    
                    HStack {
                        HStack(spacing: 2) {
                            Image("RemixIcon/System/thumb-up-line")
                                .resizable()
                                .frame(width: 12, height: 12)
                            Text("\(work.likes.formatUsingAbbrevation())")
                                .font(.system(size: 12, weight: .semibold))
                        }
                        .foregroundStyle(Color.green)
                        
                        HStack(spacing: 2) {
                            Image("RemixIcon/System/thumb-down-line")
                                .resizable()
                                .frame(width: 12, height: 12)
                            Text("\(work.dislikes.formatUsingAbbrevation())")
                                .font(.system(size: 12, weight: .semibold))
                        }
                        .foregroundStyle(Color.red)
                        
                        Spacer()
                        
                        switch work.category {
                        case .fanwork:
                            let firstFandom = work.tags.first(where: { $0.kind == .fandom })
                            if firstFandom != nil {
                                Text("\(firstFandom!.parent != nil ? firstFandom!.parent!.name.uppercased() : firstFandom!.name.uppercased())")
                                    .font(.system(size: 10, weight: .bold))
                                    .lineLimit(1)
                                    .truncationMode(.tail)
                                    .foregroundStyle(Color.secondary)
                            } else {
                                Text(work.category.rawValue.uppercased())
                                    .font(.system(size: 10, weight: .bold))
                                    .foregroundStyle(Color.secondary)
                            }
                        case .original:
                            Text(work.category.rawValue.uppercased())
                                .font(.system(size: 10, weight: .bold))
                                .foregroundStyle(Color.secondary)
                        }
                    }
                }
                .padding()
                .frame(width: geo.size.width, height: geo.size.height)
                .background(Color.gray.opacity(0.25))
            }
        }
        .clipped()
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .frame(minWidth: 350, maxWidth: fullWidth ? UIScreen.main.bounds.width : 350, minHeight: 225, maxHeight: 225)
    }
}
