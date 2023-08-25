//
//  SectionsTab.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/23/23.
//

import SwiftUI
import AlertKit

struct SectionsTab: View {
    @EnvironmentObject var userSettings: UserSettings
    @Binding var work: Work
    @State private var workSections: [WorkSectionInfo] = []
    @State private var loading = false
    @State private var sortOldest = true
    var sectionsName = "Sections"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("0 Volumes, \(workSections.count) \(sectionsName)")
                        .font(.system(size: 16, weight: .bold))
                    Text(work.status.rawValue)
                        .font(.system(size: 16))
                        .foregroundStyle(Color.gray.opacity(0.75))
                }
                Spacer()
                Button(action: changeDirection) {
                    if sortOldest {
                        Image("RemixIcon/Editor/sort-desc")
                            .resizable()
                            .frame(width: 14, height: 14)
                        Text("Oldest".uppercased())
                            .font(.system(size: 12, weight: .bold))
                    } else {
                        Image("RemixIcon/Editor/sort-asc")
                            .resizable()
                            .frame(width: 14, height: 14)
                        Text("Newest".uppercased())
                            .font(.system(size: 12, weight: .bold))
                    }
                }
                .padding(10)
                .background(Color.gray.opacity(0.25))
                .foregroundStyle(Color.text)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            .padding(.vertical, 10)
            
            if loading {
                VStack(alignment: .center) {
                    ProgressView()
                        .padding()
                }
                .frame(width: .infinity, height: 75)
            } else {
                VStack(spacing: 0) {
                    ForEach(workSections, id: \.id) { currSection in
                        if currSection.id == workSections[workSections.count - 1].id {
                            HStack(alignment: .center) {
                                VStack(alignment: .leading, spacing: 0) {
                                    Text(currSection.title)
                                        .lineLimit(1)
                                        .truncationMode(.tail)
                                    HStack(spacing: 0) {
                                        Text("\(currSection.words.formatUsingAbbrevation()) word\(pluralize(currSection.words))")
                                        Text("•")
                                            .padding(.horizontal, 2)
                                            .offset(y: 1)
                                        Text((currSection.publishedOn != nil ? currSection.publishedOn! : currSection.createdAt), style: .date)
                                    }
                                    .font(.system(size: 14))
                                    .foregroundStyle(Color.gray.opacity(0.75))
                                }
                                Spacer()
                            }
                            .padding(.horizontal, 15)
                            .frame(height: 60)
                        } else {
                            HStack(alignment: .center) {
                                VStack(alignment: .leading, spacing: 0) {
                                    Text(currSection.title)
                                        .lineLimit(1)
                                        .truncationMode(.tail)
                                    HStack(spacing: 0) {
                                        Text("\(currSection.words.formatUsingAbbrevation()) word\(pluralize(currSection.words))")
                                        Text("•")
                                            .padding(.horizontal, 2)
                                            .offset(y: 1)
                                        Text((currSection.publishedOn != nil ? currSection.publishedOn! : currSection.createdAt), style: .date)
                                    }
                                    .font(.system(size: 14))
                                    .foregroundStyle(Color.gray.opacity(0.75))
                                }
                                Spacer()
                            }
                            .padding(.horizontal, 15)
                            .frame(height: 60)
                            .overlay(Divider().frame(maxWidth: .infinity, maxHeight: 1).background(Color.gray.opacity(0.5)), alignment: .bottom)
                        }
                    }
                }
                .background(RoundedRectangle(cornerRadius: 16).fill(Color.gray.opacity(0.25)))
            }
        }
        .padding()
        .task {
            do {
                try await fetchSections()
            } catch {
                print("Error: \(error)")
            }
        }
    }
}

extension SectionsTab {
    func fetchSections() async throws {
        loading = true
        let results: [WorkSectionInfo]? = try await NetworkService.get("https://api.offprint.net/sections/fetch-sections?workId=\(work.id)&published=\(true)")
        if let sections = results {
            workSections = sections
        }
        loading = false
    }
    
    func changeDirection() {
        // TODO: allow for temporal sorting of sections
        print("Sort")
        sortOldest.toggle()
        workSections = workSections.reversed()
    }
}
