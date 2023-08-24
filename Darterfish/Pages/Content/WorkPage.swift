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
    @State private var currTab = Tabs.details
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    WorkBannerArtBlock(work: $work)
                    WorkCoverArtBlock(work: $work)
                    WorkTitleBlock(work: $work)
                    Section {
                        switch currTab {
                        case .details:
                            DetailsTab(work: $work)
                        case .sections:
                            SectionsTab(work: $work)
                        case .volumes:
                            VolumesTab(work: $work)
                        case .reviews:
                            ReviewsTab(work: $work)
                        }
                    } header: {
                        WorkTabsHeader(currTab: $currTab)
                    }
                }
                .background(Color("BackgroundColor").ignoresSafeArea())
                .overlay {
                    GeometryReader { geo in
                        let offset = geo.frame(in: .named("workPageScroll")).minY
                        Color.clear.preference(key: WorkPageOffsetPreferenceKey.self, value: offset)
                    }
                }
            }
            .coordinateSpace(name: "workPageScroll")
            .onPreferenceChange(WorkPageOffsetPreferenceKey.self) { value in
                scrollOffset = value * -1.0
            }
            .ignoresSafeArea(edges: .top)
            .background(Color("BackgroundColor"))
            .safeAreaInset(edge: .top) {
                HStack {
                    Button(action: { dismiss() }) {
                        ZStack {
                            Circle()
                                .fill(.ultraThinMaterial)
                            Image("RemixIcon/System/close-line")
                                .frame(width: 14, height: 14)
                        }
                        .foregroundColor(Color.text)
                        .frame(width: 34, height: 34)
                    }
                    
                    Spacer()
                    
                    Button(action: { print("Add to Library") }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.ultraThinMaterial)
                            HStack(spacing: 0) {
                                Image("RemixIcon/System/add-line")
                                    .frame(width: 14, height: 14)
                                    .padding(.trailing, 5)
                                Text("Library".uppercased())
                                    .font(.system(size: 13))
                                    .bold()
                            }
                        }
                        .foregroundColor(Color.text)
                        .frame(width: 92, height: 34)
                    }
                    
                    Menu {
                        Button(action: { print("Add to Shelf") }) {
                            Image("RemixIcon/Business/bar-chart-fill")
                            Text("Add to Shelf")
                        }
                        if let title = work.title.slugify() {
                            ShareLink(item: URL(string: "https://offprint.net/work/\(work.id)/\(title)")!) {
                                Image("RemixIcon/System/share-box-line")
                                Text("Share This")
                            }
                        }
                        Divider()
                        Button(role: .destructive, action: { print("Report") }) {
                            Image("RemixIcon/System/alarm-warning-line")
                            Text("Report")
                        }
                    } label: {
                        ZStack {
                            Circle()
                                .fill(.ultraThinMaterial)
                            Image("RemixIcon/System/more-fill")
                                .frame(width: 14, height: 14)
                        }
                        .foregroundColor(Color.text)
                        .frame(width: 34, height: 34)
                    }
                }
                .padding(.top, 0)
                .padding(.leading)
                .padding(.trailing)
                .padding(.bottom)
                .background(.ultraThinMaterial.opacity(
                    scrollOffset > 0 ? (scrollOffset > 170 ? 1.0 : scrollOffset / 170) : 0
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
    
    enum Tabs: String, Identifiable, CaseIterable {
        case details
        case sections
        case volumes
        case reviews
        
        var id: Self {
            return self
        }
    }
}
