//
//  Section.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/24/23.
//

import Foundation

struct WorkSection: Codable, Identifiable {
    let id: String
    let work: WorkInfo
    let volume: VolumeInfo?
    var title: String
    var body: String
    var words: Int64
    var noteTop: String?
    var noteBottom: String?
    var lang: Language
    var rank: Int64
    let publishedOn: Date?
    let firstPublished: Date?
    let createdAt: Date
    let updatedAt: Date
}

extension WorkSection {
    struct WorkInfo: Codable {
        let id: String
    }
    
    struct VolumeInfo: Codable {
        var id: String
    }
}
