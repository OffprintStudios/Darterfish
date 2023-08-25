//
//  Volume.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/24/23.
//

import Foundation

struct Volume: Codable, Identifiable {
    let id: String
    let work: WorkInfo
    var title: String
    var desc: String
    var sections: [WorkSection]?
    var coverArt: String?
    var publishedOn: Date?
    let createdAt: Date
    let updatedAt: Date
}

extension Volume {
    struct WorkInfo: Codable {
        var id: String
    }
}
