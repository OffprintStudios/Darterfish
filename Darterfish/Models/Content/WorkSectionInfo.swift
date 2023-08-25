//
//  SectionInfo.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/24/23.
//

import Foundation

struct WorkSectionInfo: Codable, Identifiable {
    let id: String
    let title: String
    let words: Int64
    let lang: Language
    var rank: Int64
    let publishedOn: Date?
    let createdAt: Date
    let volume: Volume?
}
