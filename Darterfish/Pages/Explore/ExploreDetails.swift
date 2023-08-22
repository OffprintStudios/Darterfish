//
//  ExploreDetails.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/20/23.
//

import SwiftUI

struct ExploreDetails: View {   
    @EnvironmentObject var userSettings: UserSettings
    @Environment(\.dismiss) var dismiss
    @State private var loading = false
    @State private var works: Paginate<Work> = .init(items: [], metadata: .init(page: 1, per: 6, total: 0))
    @State var currCategory: ExploreFilters.Categories
    @State var currType: ExploreFilters.Types
    @State var currGenre: Tag?
    @State var currRating: ExploreFilters.Ratings
   
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            ScrollView {
                LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders]) {
                    Section {
                        Spacer()
                        if loading {
                            ProgressView()
                                .padding()
                        } else {
                            ForEach(0..<works.items.count, id: \.self) { idx in
                                WorkCard(work: $works.items[idx], fullWidth: true)
                                    .padding(.leading)
                                    .padding(.trailing)
                            }
                        }
                        Spacer()
                    } header: {
                        ExploreFilters(currCategory: $currCategory, currType: $currType, currGenre: $currGenre, currRating: $currRating)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .safeAreaInset(edge: .top, spacing: 0) {
            HStack {
                HStack(spacing: 0) {
                    Image("RemixIcon/Arrows/arrow-left-s-line")
                        .resizable()
                        .frame(width: 22.0, height: 22.0)
                    Text("Back")
                        .font(.custom("JosefinSans-Regular", size: 18.0))
                        .offset(y: 2)
                }
                .padding(.leading)
                .offset(y: 7)
                .foregroundStyle(Color.white)
                .onTapGesture {
                    dismiss()
                }
                
                Spacer()
                
                Text("Explore")
                    .font(.custom("JosefinSans-Regular", size: 18.0))
                    .padding(.top)
                    .offset(x: -39, y: 2)
                    .foregroundStyle(Color.white)
                
                Spacer()
                
                Button(action: { print("Search") }) {
                    Image("RemixIcon/System/search-eye-line")
                        .resizable()
                        .frame(width: 28, height: 28)
                }
                .foregroundStyle(Color.white)
                .padding(.trailing)
            }
            .padding(.bottom)
            .background(Color(userSettings.theme.accent))
        }
        .task {
            do {
                loading = true
                var result: Paginate<Work>?
                switch currCategory {
                case .newest:
                    result = try await getNewWorks(page: 1, per: 25)
                    break
                case .updated:
                    result = try await getRecentlyUpdated(page: 1, per: 25)
                    break
                }
                if result != nil {
                    works = result!
                }
                loading = false
            } catch {
                print("Error: \(error)")
            }
        }
        .task(id: currCategory, priority: .userInitiated) {
            do {
                loading = true
                var result: Paginate<Work>?
                switch currCategory {
                case .newest:
                    result = try await getNewWorks(page: 1, per: 25)
                    break
                case .updated:
                    result = try await getRecentlyUpdated(page: 1, per: 25)
                    break
                }
                if result != nil {
                    works = result!
                }
                loading = false
            } catch {
                print("Error: \(error)")
            }
        }
    }
}

#Preview {
    ExploreDetails(currCategory: .newest, currType: .all, currRating: .all)
        .environmentObject(UserSettings())
}
