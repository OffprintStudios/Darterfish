//
//  Theme.swift
//  Darterfish
//
//  Created by Alyx Mote on 8/15/23.
//

import UIKit

protocol Theme {
    var name: String { set get }
    var accent: UIColor { get }
    var accentDark: UIColor { get }
    var accentLight: UIColor { get }
}
