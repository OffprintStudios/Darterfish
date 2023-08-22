//
//  RecentlyUpdatedList.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/19/23.
//

import SwiftUI

struct RecentlyUpdatedList: View {
    @Binding var iconSize: CGFloat
    @State var loading = false
    @State private var recentlyUpdated: Paginate<Work> = .init(items: [], metadata: .init(page: 1, per: 6, total: 0))
    
    var body: some View {
        Section {
            VStack {
                NavigationLink {
                    ExploreDetails(currCategory: .newest, currType: .all, currRating: .all)
                } label: {
                    HStack {
                        Image("RemixIcon/Map/signal-tower-line")
                            .resizable()
                            .frame(width: iconSize, height: iconSize)
                        Text("Recently Updated")
                            .font(.custom("JosefinSans-SemiBold", size: 20))
                            .offset(y: 2)
                        Spacer()
                        ZStack {
                            Image("RemixIcon/Arrows/arrow-right-s-line")
                                .resizable()
                                .frame(width: iconSize, height: iconSize)
                        }
                    }
                    .padding(.leading)
                    .padding(.trailing)
                }
                .foregroundStyle(Color.text)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    if loading {
                        LazyHStack(spacing: 10.0) {
                            ForEach(0..<1) { i in
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.gray.opacity(0.25))
                                    .frame(width: 350, height: 175)
                            }
                        }
                        .scrollTargetLayout()
                    } else {
                        LazyHStack(spacing: 10.0) {
                            ForEach(0..<recentlyUpdated.items.count, id: \.self) { idx in
                                WorkCard(work: $recentlyUpdated.items[idx])
                            }
                        }
                        .scrollTargetLayout()
                    }
                }
                .scrollTargetBehavior(.viewAligned)
                .safeAreaPadding(.horizontal)
            }
            .frame(height: 225)
            .padding(.top)
        }
        .task {
            do {
                loading = true
                let result = try await getRecentlyUpdated()
                if result != nil {
                    recentlyUpdated = result!
                }
                loading = false
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
