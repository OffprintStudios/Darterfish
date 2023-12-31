//
//  Profile.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/18/23.
//

import Foundation

struct Profile: Codable, Identifiable {
    let id: String
    let account: AccountInfo?
    var username: String
    var avatar: String
    var bannerArt: String?
    var info: Info
    var stats: Stats
    var links: [String: String]
    let createdAt: Date
    let updatedAt: Date
}

extension Profile {
    struct AccountInfo: Codable {
        let id: String
        let roles: [Roles]?
    }
    
    struct Info: Codable {
        var bio: String?
        var tagline: String?
        var presence: Presence
    }
    
    struct Stats: Codable {
        var works: Int64
        var blogs: Int64
        var followers: Int64
        var following: Int64
    }
}
