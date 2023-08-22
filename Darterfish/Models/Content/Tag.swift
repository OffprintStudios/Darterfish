//
//  Tag.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/18/23.
//

import Foundation

final class Tag: Codable, Identifiable {
    let id: String
    let name: String
    let desc: String?
    let parent: Tag?
    let children: [Tag]
    let works: [String: String]
    let kind: TagKind
    let createdAt: Date
    let updatedAt: Date
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.desc = try container.decodeIfPresent(String.self, forKey: .desc)
        self.parent = try? container.decodeIfPresent(Tag.self, forKey: .parent)
        self.children = try container.decodeIfPresent([Tag].self, forKey: .children) ?? []
        self.works = try container.decodeIfPresent([String: String].self, forKey: .works) ?? [:]
        self.kind = try container.decode(TagKind.self, forKey: .kind)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
    }
}

extension Tag {
    enum TagKind: String, Codable {
       case fandom = "Fandom"
       case warning = "Warning"
       case genre = "Genre"
       case user = "User"
       case category = "Category"
       case rating = "Rating"
       case status = "Status"
       case workKind = "WorkKind"
    }
    
    struct FetchTag: Codable, Hashable {
        static func == (lhs: Tag.FetchTag, rhs: Tag.FetchTag) -> Bool {
            return lhs.tag.id == rhs.tag.id
        }
        
        func hash(into hasher: inout Hasher) {
            return hasher.combine(tag.id)
        }
        
        let tag: Tag
        let works: UInt64?
    }
}

let TagIconStrings: [String: String] = [
    "Action/Adventure": "RemixIcon/Others/sword-line",
    "Comedy": "RemixIcon/UserAndFaces/emotion-laugh-line",
    "Drama": "RemixIcon/Document/file-paper-2-line",
    "Erotica": "RemixIcon/Others/door-closed-line",
    "Fantasy": "RemixIcon/Design/magic-line",
    "Horror": "RemixIcon/UserAndFaces/ghost-2-line",
    "Mystery": "RemixIcon/System/search-2-line",
    "Romance": "RemixIcon/HealthAndMedical/hearts-line",
    "Science Fiction": "RemixIcon/UserAndFaces/aliens-line",
    "Slice of Life": "RemixIcon/Buildings/home-3-line",
    "Speculative Fiction": "RemixIcon/Weather/meteor-line",
    "Thriller": "RemixIcon/UserAndFaces/spy-line",
    "Tragedy": "RemixIcon/UserAndFaces/skull-line",
    "Dark": "RemixIcon/Design/contrast-2-line",
    "Sad": "RemixIcon/UserAndFaces/emotion-sad-line"
]
