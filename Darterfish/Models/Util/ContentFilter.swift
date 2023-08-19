//
//  ContentFilter.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/18/23.
//

import Foundation

enum ContentFilter: String, Codable {
    case restricted
    case mature
    case explicit
    case everything
}
