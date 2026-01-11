//
//  Monster.swift
//  DandDMonsters
//
//  Created by app-kaihatsusha on 11/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//
// https://www.dnd5eapi.co/api/2014/monsters

import Foundation

struct Monster: Codable, Identifiable {
    var id = UUID().uuidString
    
    var index: String = ""
    var name: String = ""
    var url: String = ""
    
    enum CodingKeys: CodingKey {
        case index
        case name
        case url
    }
}
