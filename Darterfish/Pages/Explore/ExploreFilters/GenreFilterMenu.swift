//
//  GenreFilter.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/21/23.
//

import SwiftUI

struct GenreFilterMenu: View {
    @Binding var currGenre: Tag?
    @State private var genres: [Tag.FetchTag] = []
    @State private var loading = false
    
    var body: some View {
        Menu {
            Button(action: { currGenre = nil }) {
                Image("RemixIcon/Others/box-2-fill")
                Text("All Genres")
            }
            ForEach(genres, id: \.self) { genre in
                Button(action: { currGenre = genre.tag }) {
                    Image(TagIconStrings[genre.tag.name]!)
                    Text(genre.tag.name)
                }
            }
        } label: {
            HStack(spacing: 2) {
                if let genre = currGenre {
                    Image(TagIconStrings[genre.name]!)
                        .resizable()
                        .frame(width: 18, height: 18)
                        .padding(.trailing, 5)
                    Text(currGenre!.name.uppercased())
                        .font(.system(size: 12, weight: .bold))
                } else {
                    Image("RemixIcon/Others/box-2-fill")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .padding(.trailing, 5)
                    Text("ALL GENRES")
                        .font(.system(size: 12, weight: .bold))
                }
            }
            .padding(.leading, 15)
            .padding(.top)
            .padding(.bottom)
            .padding(.trailing, 15)
        }
        .task {
            do {
                loading = true
                let result = try await getGenres()
                if result != nil {
                    genres = result!
                }
                loading = false
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
