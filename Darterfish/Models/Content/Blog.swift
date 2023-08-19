//
//  Blog.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/18/23.
//

import Foundation

struct Blog: Codable, Identifiable {
    let id: String
    let author: Profile
    var title: String
    var desc: String?
    var body: String
    var bannerArt: String?
    var rating: ContentRating
    var stats: Stats
    var publishedOn: Date?
    var editedOne: Date?
    var newsPost: Bool
    let createdAt: Date
    let updatedAt: Date
    let deletedAt: Date?
}

extension Blog {
    struct Stats: Codable {
        var words: Int
        var views: Int
        var comments: Int
        var favorites: Int
    }
}
