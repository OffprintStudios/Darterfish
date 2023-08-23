//
//  WorkPage.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/22/23.
//

import SwiftUI

struct WorkPage: View {
    @EnvironmentObject var userSettings: UserSettings
    @Environment(\.dismiss) var dismiss
    @State private var scrollOffset: CGFloat = .zero
    @Binding var work: Work
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    Color("BackgroundColor").ignoresSafeArea()
                    VStack(spacing: 0) {
                        ParallaxHeader(coordinateSpace: "workPageScroll", defaultHeight: 200) {
                            if let bannerArt = work.bannerArt {
                                AsyncImage(url: URL(string: bannerArt)) { phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .scaledToFill()
                                    } else {
                                        Image("RemixIcon/Media/image-line")
                                            .resizable()
                                            .frame(width: 36, height: 36)
                                    }
                                }
                            } else {
                                Color(userSettings.theme.accent)
                            }
                        }
                        VStack {
                            WorkCoverArtBlock(work: $work)
                            
                            Text(work.title)
                            Spacer()
                        }
                        .padding()
                        .background(Color("BackgroundColor"))
                        .frame(height: 1000)
                    }
                    GeometryReader { geo in
                        let offset = geo.frame(in: .named("workPageScroll")).minY
                        Color.clear.preference(key: WorkPageOffsetPreferenceKey.self, value: offset)
                    }
                }
                .background(Color("BackgroundColor"))
            }
            .coordinateSpace(name: "workPageScroll")
            .onPreferenceChange(WorkPageOffsetPreferenceKey.self) { value in
                scrollOffset = value * -1.0
            }
            .ignoresSafeArea(edges: .top)
            .background(Color("BackgroundColor"))
            .safeAreaInset(edge: .top) {
                HStack {
                    Spacer()
                    Button(action: { dismiss() }) {
                        ZStack {
                            Circle()
                                .fill(Color.white.opacity(
                                    scrollOffset > 0 ? (scrollOffset > 230 ? 1.0 : (scrollOffset / 230) + 0.5) : 0.5
                                ))
                            Image("RemixIcon/System/close-line")
                        }
                        .foregroundColor(Color(userSettings.theme.accent))
                        .frame(width: 24, height: 24)
                    }
                }
                .padding(.leading)
                .padding(.trailing)
                .padding(.bottom)
                .background(Color(userSettings.theme.accent).opacity(
                    scrollOffset > 0 ? (scrollOffset > 230 ? 1.0 : scrollOffset / 230) : 0
                ))
            }
        }
    }
}

extension WorkPage {
    struct WorkPageOffsetPreferenceKey: PreferenceKey {
        typealias Value = CGFloat
        static var defaultValue = CGFloat.zero
        static func reduce(value: inout Value, nextValue: () -> Value) {
            value += nextValue()
        }
    }
}
