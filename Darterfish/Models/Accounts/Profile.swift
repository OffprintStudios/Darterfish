//
//  Profile.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/18/23.
//

import Foundation

struct Profile {
    let id: String
    let account: AccountInfo
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
    struct AccountInfo {
        let id: String
        let roles: [Roles]
    }
    
    struct Info {
        var bio: String?
        var tagline: String?
        var presence: Presence
    }
    
    struct Stats {
        var works: Int
        var blogs: Int
        var followers: Int
        var following: Int
    }
}
