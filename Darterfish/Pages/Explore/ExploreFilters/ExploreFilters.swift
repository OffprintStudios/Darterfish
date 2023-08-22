//
//  ExploreDetailsFilters.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/21/23.
//

import SwiftUI

struct ExploreFilters: View {
    @Binding var currCategory: Categories
    @Binding var currType: Types
    @Binding var currGenre: Tag?
    @Binding var currRating: Ratings

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .firstTextBaseline, spacing: 0) {
                CategoryFilterMenu(currCategory: $currCategory)
                    .foregroundStyle(Color.text)
                    .overlay(Rectangle().frame(width: 1, height: nil, alignment: .trailing).foregroundColor(Color.gray.opacity(0.5)), alignment: .trailing)
                
                TypeFilterMenu(currType: $currType)
                    .foregroundStyle(Color.text)
                    .overlay(Rectangle().frame(width: 1, height: nil, alignment: .trailing).foregroundColor(Color.gray.opacity(0.5)), alignment: .trailing)
                
                GenreFilterMenu(currGenre: $currGenre)
                    .foregroundStyle(Color.text)
                    .overlay(Rectangle().frame(width: 1, height: nil, alignment: .trailing).foregroundColor(Color.gray.opacity(0.5)), alignment: .trailing)
                
                RatingFilterMenu(currRating: $currRating)
                    .foregroundStyle(Color.text)
            }
        }
        .frame(height: 50)
        .background(.ultraThinMaterial)
        .overlay(Divider().frame(maxWidth: .infinity, maxHeight: 1).background(Color.gray.opacity(0.5)), alignment: .top)
        .overlay(Divider().frame(maxWidth: .infinity, maxHeight: 1).background(Color.gray.opacity(0.5)), alignment: .bottom)
    }
}

extension ExploreFilters {
    enum Categories: String, CaseIterable {
        //case recommendations = "Recs"
        //case trending = "Trending"
        case newest = "Newest"
        case updated = "Updated"
        //case news = "News"
    }
    
    enum Types: String, CaseIterable {
        case all = "All Works"
        case original
        case fanwork
    }
    
    enum Ratings: String, CaseIterable {
        case all = "All Ratings"
        case everyone
        case teen
        case mature
        case explicit
    }
    
    func changeCurrCategory(to filter: Categories) -> () -> Void {
        return {
            currCategory = filter
        }
    }
    
    func changeCurrType(to filter: Types) -> () -> Void {
        return {
            currType = filter
        }
    }
    
    func changeCurrGenre(to genre: Tag?) -> () -> Void {
        return {
            currGenre = genre
        }
    }
}
