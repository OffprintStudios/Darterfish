//
//  Work.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/18/23.
//

import Foundation

struct Work: Codable, Identifiable {
    let id: String
    let author: Profile
    let title: String
    let shortDesc: String
    let longDesc: String
    let category: Category
    let rating: ContentRating
    let status: Status
    let tags: [Tag]
    let coverArt: String?
    let bannerArt: String?
    let words: Int64
    let views: Int64
    var likes: Int64
    var dislikes: Int64
    let kind: Kind
    var approvalStatus: ApprovalStatus
    var publishedOn: Date?
    let lastSectionUpdate: Date?
    let createdAt: Date
    let updatedAt: Date
}

extension Work {
    enum Category: String, Codable {
        case original = "Original"
        case fanwork = "Fanwork"
    }
    
    enum Status: String, Codable {
        case incomplete = "Incomplete"
        case complete = "Complete"
        case paused = "Paused"
        case cancelled = "Cancelled"
    }
    
    enum Kind: String, Codable {
        case prose = "Prose"
        case poetry = "Poetry"
        case nonfiction = "Nonfiction"
        case script = "Script"
        case anthology = "Anthology"
    }
    
    enum ApprovalStatus: String, Codable {
        case notSubmitted = "NotSubmitted"
        case approved = "Approved"
        case pending = "Pending"
        case rejected = "Rejected"
    }
}
