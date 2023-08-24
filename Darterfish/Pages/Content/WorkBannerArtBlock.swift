//
//  WorkBannerArtBlock.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/22/23.
//

import SwiftUI

struct WorkBannerArtBlock: View {
    @EnvironmentObject var userSettings: UserSettings
    @Binding var work: Work
    
    var body: some View {
        Section {
            GeometryReader { proxy in
                ZStack {
                    if let bannerArt = work.bannerArt {
                        AsyncImage(url: URL(string: bannerArt)!) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: proxy.size.width, height: proxy.size.height + 350)
                                    .clipShape(Rectangle())
                                    .background(Color(userSettings.theme.accent))
                            }
                        }
                    }
                }
                .ignoresSafeArea(.all)
                .clipped()
                .frame(width: proxy.size.width, height: proxy.size.height + 350)
                .background(Color(userSettings.theme.accent))
            }
        }
        .offset(y: -50)
    }
}
