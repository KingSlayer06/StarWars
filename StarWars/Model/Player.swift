//
//  Player.swift
//  StarWars
//
//  Created by Himanshu Sherkar on 13/02/24.
//

import Foundation

class Player {
    let id: Int
    let name: String
    let icon: String
    var score: Int
    var points: Int
    var matches: [PlayerMatch]
    
    init(id: Int, name: String, icon: String, score: Int, points: Int, matches: [PlayerMatch] = [PlayerMatch]()) {
        self.id = id
        self.name = name
        self.icon = icon
        self.score = score
        self.points = points
        self.matches = matches
    }
    
    func setScore(score: Int) {
        self.score = score
    }
    
    func setPoints(points: Int) {
        self.points = points
    }
    
    func setMatches(matches: [PlayerMatch]) {
        self.matches = matches
    }
}
