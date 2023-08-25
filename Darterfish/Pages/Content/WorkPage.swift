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
                    
                    HStack(spacing: 0) {
                        HStack(spacing: 5) {
                            Spacer()
                            Image("RemixIcon/Document/book-open-line")
                                .resizable()
                                .frame(width: 16, height: 16)
                            Text("Start Reading".uppercased())
                                .font(.system(size: 14, weight: .bold))
                            Spacer()
                        }
                        .padding(.init(top: 12, leading: 10, bottom: 12, trailing: 10))
                        .background {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.green)
                        }
                        .foregroundStyle(Color.white)
                    }
                    .padding(15)
                    
                    let sectionsName = switch work.kind {
                    case .prose:
                        "Chapters"
                    case .poetry:
                        "Poems"
                    case .nonfiction:
                        "Sections"
                    case .script:
                        "Parts"
                    case .anthology:
                        "Entries"
                    }
                    
                    Section {
                        switch currTab {
                        case .details:
                            DetailsTab(work: $work)
                        case .sections:
                            SectionsTab(work: $work, sectionsName: sectionsName)
                        case .reviews:
                            ReviewsTab(work: $work)
                        }
                    } header: {
                        WorkTabsHeader(currTab: $currTab, sectionsName: sectionsName)
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
                WorkToolBar(work: $work)
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
        case reviews
        
        var id: Self {
            return self
        }
    }
}
