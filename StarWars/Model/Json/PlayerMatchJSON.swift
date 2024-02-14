//
//  Match.swift
//  StarWars
//
//  Created by Himanshu Sherkar on 13/02/24.
//

import Foundation

struct PlayerMatchJSON: Codable {
    let match: Int
    let player1: _Player
    let player2: _Player
}

struct _Player: Codable {
    let id: Int
    let score: Int
}
