//
//  Roles.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/18/23.
//

import Foundation

enum Roles: String, Codable {
    case admin = "Admin"
    case moderator = "Moderator"
    case workApprover = "WorkApprover"
    case chatModerator = "ChatModerator"
    case maintainer = "Maintainer"
    case contributor = "Contributor"
    case vip = "VIP"
    case supporter = "Supporter"
    case user = "User"
}
