//
//  DetailsTab.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/23/23.
//

import SwiftUI
import RichText

struct DetailsTab: View {
    @EnvironmentObject var userSettings: UserSettings
    @Binding var work: Work
    @State private var coverArtOpen = false
    @State private var bannerArtOpen = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            VStack(alignment: .leading) {
                Text("Description")
                    .font(.custom("JosefinSans-SemiBold", size: 24))
                    .foregroundStyle(Color(userSettings.theme.accent))
                
                RichText(html: work.longDesc)
                    .placeholder {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.gray.opacity(0.25))
                            .frame(width: .infinity, height: 350)
                    }
                    .transition(.easeOut)
            }
            
            VStack(alignment: .leading) {
                Text("Tags")
                    .font(.custom("JosefinSans-SemiBold", size: 24))
                    .foregroundStyle(Color(userSettings.theme.accent))
                
                WrappingHStack(alignment: .topLeading) {
                    ForEach(work.tags, id: \.id) { tag in
                        TagBadge(tag: tag)
                    }
                }
            }
            
            VStack(alignment: .leading) {
                Text("Stats")
                    .font(.custom("JosefinSans-SemiBold", size: 24))
                    .foregroundStyle(Color(userSettings.theme.accent))
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack(alignment: .top) {
                        Image("RemixIcon/Business/line-chart-line")
                            .resizable()
                            .frame(width: 18, height: 18)
                        Text("Views")
                        Spacer()
                        Text("\(work.views.formatUsingAbbrevation())")
                            .font(.system(size: 16, weight: .bold))
                    }
                    .padding()
                    .overlay(Divider().frame(maxWidth: .infinity, maxHeight: 1).background(Color.gray.opacity(0.5)), alignment: .bottom)
                    
                    HStack(alignment: .top) {
                        Image("RemixIcon/Design/pen-nib-line")
                            .resizable()
                            .frame(width: 18, height: 18)
                        Text("Words")
                        Spacer()
                        Text("\(work.words.formatUsingAbbrevation())")
                            .font(.system(size: 16, weight: .bold))
                    }
                    .padding()
                }
                .background(Color.gray.opacity(0.25))
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            
            VStack(alignment: .leading) {
                Text("Artwork")
                    .font(.custom("JosefinSans-SemiBold", size: 24))
                    .foregroundStyle(Color(userSettings.theme.accent))
                
                HStack(alignment: .center, spacing: 10) {
                    if let coverArt = work.coverArt {
                        AsyncImage(url: URL(string: coverArt)!) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .onTapGesture {
                                        coverArtOpen.toggle()
                                    }
                                    .sheet(isPresented: $coverArtOpen) {
                                        ImagePreviewSheet(imageUrl: coverArt)
                                    }
                            }
                        }
                    }
                    if let bannerArt = work.bannerArt {
                        AsyncImage(url: URL(string: bannerArt)!) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .onTapGesture {
                                        bannerArtOpen.toggle()
                                    }
                                    .sheet(isPresented: $bannerArtOpen) {
                                        ImagePreviewSheet(imageUrl: bannerArt)
                                    }
                            }
                        }
                    }
                    if work.coverArt == nil && work.bannerArt == nil {
                        Spacer()
                        VStack(alignment: .center) {
                            Text("No Artwork Available".uppercased())
                                .font(.system(size: 12, weight: .bold))
                                .foregroundStyle(Color.gray.opacity(0.75))
                        }
                        .frame(width: .infinity, height: 100)
                        Spacer()
                    }
                }
                .frame(height: 100)
            }
            
            VStack(alignment: .leading) {
                Text("Misc")
                    .font(.custom("JosefinSans-SemiBold", size: 24))
                    .foregroundStyle(Color(userSettings.theme.accent))
                
                VStack(alignment: .leading) {
                    HStack(alignment: .center, spacing: 0) {
                        Text("Category")
                            .foregroundStyle(Color.gray)
                        Spacer()
                        Text(work.category.rawValue)
                    }
                    .padding(.top, 7)
                    .padding(.bottom)
                    .overlay(Divider().frame(maxWidth: .infinity, maxHeight: 1).background(Color.gray.opacity(0.25)), alignment: .bottom)
                    
                    HStack(alignment: .center, spacing: 0) {
                        Text("Kind")
                            .foregroundStyle(Color.gray)
                        Spacer()
                        Text(work.kind.rawValue)
                    }
                    .padding(.top, 7)
                    .padding(.bottom)
                    .overlay(Divider().frame(maxWidth: .infinity, maxHeight: 1).background(Color.gray.opacity(0.25)), alignment: .bottom)
                    
                    HStack(alignment: .center, spacing: 0) {
                        Text("Status")
                            .foregroundStyle(Color.gray)
                        Spacer()
                        Text(work.status.rawValue)
                    }
                    .padding(.top, 7)
                    .padding(.bottom)
                    .overlay(Divider().frame(maxWidth: .infinity, maxHeight: 1).background(Color.gray.opacity(0.25)), alignment: .bottom)
                    
                    HStack(alignment: .center, spacing: 0) {
                        Text("Content Rating")
                            .foregroundStyle(Color.gray)
                        Spacer()
                        Text(work.rating.rawValue)
                    }
                    .padding(.top, 7)
                    .padding(.bottom)
                    .overlay(Divider().frame(maxWidth: .infinity, maxHeight: 1).background(Color.gray.opacity(0.25)), alignment: .bottom)
                    
                    HStack(alignment: .center, spacing: 0){
                        if let publishedOn = work.publishedOn {
                            Text("Published On")
                                .foregroundStyle(Color.gray)
                            Spacer()
                            Text(publishedOn, style: .date)
                        } else {
                            Text("Created At")
                                .foregroundStyle(Color.gray)
                            Spacer()
                            Text(work.createdAt, style: .date)
                        }
                    }
                    .padding(.top, 7)
                    .padding(.bottom)
                }
            }
        }
        .padding(.top, 25)
        .padding(.leading)
        .padding(.trailing)
        .padding(.bottom)
    }
}
