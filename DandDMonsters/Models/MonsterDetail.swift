//
//  MonsterDetail.swift
//  DandDMonsters
//
//  Created by app-kaihatsusha on 11/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//
// "https://www.dnd5eapi.co" + "/api/2014/monsters/adult-gold-dragon"

import Foundation

struct MonsterDetail: Codable {
    var name: String = ""
    var size: String = ""
    var type: String = ""
    var alignment: String = ""
    var hit_points: Int = 0
    var image: String? = ""
    
    enum CodingKeys: CodingKey {
        case name
        case size
        case type
        case alignment
        case hit_points
        case image
    }
}
