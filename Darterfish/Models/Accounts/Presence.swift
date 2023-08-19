//
//  Presence.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/18/23.
//

import Foundation

enum Presence: String, Codable {
    case online = "Online"
    case offline = "Offline"
    case away = "Away"
    case doNotDisturb = "Do Not Disturb"
}
