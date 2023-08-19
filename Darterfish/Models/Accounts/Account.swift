//
//  Account.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/18/23.
//

import Foundation

struct Account: Codable, Identifiable {
    let id: String
    var profiles: [Profile]
    var roles: [Roles]
    var termsAgree: Bool
    var emailConfirmed: Bool
    let createdAt: Date
    let updatedAt: Date
    let token: String?
}
