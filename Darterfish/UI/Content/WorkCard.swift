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
    
    var body: some View {
        HStack {
            GeometryReader { geo in
                Color(userSettings.theme.accent)
                    .frame(width: geo.size.width, height: geo.size.height * 0.4)
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
                                        .offset(x: -5, y: -2)
                                }
                                .frame(width: 100, height: 160)
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
                        Text("by \(work.author.username)")
                            .font(.custom("JosefinSans-Regular", size: 12))
                            .foregroundStyle(Color.secondary)
                            .lineLimit(1)
                            .truncationMode(.tail)
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
                }
                .padding()
                .frame(width: geo.size.width, height: geo.size.height)
                .background(Color.gray.opacity(0.25))
            }
        }
        .clipped()
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .frame(width: 350, height: 175)
    }
}
