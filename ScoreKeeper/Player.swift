//
//  Player.swift
//  ScoreKeeper
//
//  Created by Dax Gerber on 11/2/23.
//

import Foundation

struct Player: Comparable {
    static func < (lhs: Player, rhs: Player) -> Bool {
        return lhs.score > rhs.score
    }
    
    var score: Int
    var name: String
}
