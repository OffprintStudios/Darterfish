//
//  Theme.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/15/23.
//

import Foundation
import SwiftUI

protocol Theme {
    static var name: String { set get }
    var accent: Color { set get }
    var accentDark: Color { set get }
    var accentLight: Color { set get }
}
