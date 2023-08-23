//
//  NewWorksList.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/19/23.
//

import SwiftUI

struct NewWorksList: View {
    @Binding var iconSize: CGFloat
    @State private var loading = false
    @State private var newWorks: Paginate<Work> = .init(items: [], metadata: .init(page: 1, per: 6, total: 0))
    
    var body: some View {
        Section {
            VStack(spacing: 0) {
                NavigationLink {
                    ExploreDetails(currCategory: .newest, currType: .all, currRating: .all)
                } label: {
                    HStack {
                        Image("RemixIcon/System/loader-2-line")
                            .resizable()
                            .frame(width: iconSize, height: iconSize)
                        Text("What's New")
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
                            ForEach(0..<newWorks.items.count, id: \.self) { idx in
                                WorkCard(work: $newWorks.items[idx])
                            }
                        }
                        .scrollTargetLayout()
                    }
                }
                .scrollTargetBehavior(.viewAligned)
                .safeAreaPadding(.horizontal)
            }
            .frame(height: 275)
            .padding(.top)
        }
        .task {
            do {
                loading = true
                let result = try await getNewWorks()
                if result != nil {
                    newWorks = result!
                }
                loading = false
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
