//
//  Paginate.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/18/23.
//

import Foundation

struct Paginate<T: Codable>: Codable {
    var items: [T]
    let metadata: Metadata
}

extension Paginate {
    struct Metadata: Codable {
        let page: Int64
        let per: Int64
        let total: Int64
    }
}
