//
//  Tag.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/18/23.
//

import Foundation

struct Tag {
    let id: String
    let name: String
    let desc: String
    let parent: Parent?
    let children: [Tag]?
    let works: [String: String]?
    let kind: TagKind
    let createdAt: Date
    let updatedAt: Date
}

extension Tag {
    struct Parent {
        let id: String
        let name: String
        let desc: String
        let works: [String: String]?
        let kind: TagKind
        let createdAt: Date
        let updatedAt: Date
        
    }
    
    enum TagKind: String {
       case fandom = "Fandom"
       case warning = "Warning"
       case genre = "Genre"
       case user = "User"
       case category = "Category"
       case rating = "Rating"
       case status = "Status"
       case workKind = "WorkKind"
    }
}
