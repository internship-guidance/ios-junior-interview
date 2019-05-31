//
//  Item.swift
//  ios-junior-interview
//
//  Created by egmars.janis.timma on 31/05/2019.
//  Copyright © 2019 egmars.janis.timma. All rights reserved.
//

import Foundation

struct Item: Codable {
    var title: String
    var url: URL
    var ingredients: [String]
}
