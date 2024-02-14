//
//  StarWarsTournamentViewModel.swift
//  StarWars
//
//  Created by Himanshu Sherkar on 13/02/24.
//

import Foundation

final class StarWarsTournamentViewModel: ObservableObject {
    
    private (set) var players: [Player] = []
    
    private (set) var matches: [PlayerMatch] = []
    
    init() {
        self.getPlayers()
        self.getMatches()
        self.initialize()
    }
    
    private func getPlayers() {
        if let path = Bundle.main.url(forResource: "StarWarsPlayers", withExtension: "json") {
            do {
                let data = try Data(contentsOf: path)
                let decoder = JSONDecoder()
                
                let jsonData = try decoder.decode([PlayerJSON].self, from: data)
                
                for data in jsonData {
                    let player = Player(id: data.id,
                                        name: data.name,
                                        icon: data.icon,
                                        score: 0,
                                        points: 0)
                    
                    players.append(player)
                }
                
            } catch {
                print("Failed to parse data")
            }
        }
    }
    
    private func getMatches() {
        if let path = Bundle.main.url(forResource: "StarWarsMatches", withExtension: "json") {
            do {
                let data = try Data(contentsOf: path)
                let decoder = JSONDecoder()
                
                let jsonData = try decoder.decode([PlayerMatchJSON].self, from: data)
                
                for data in jsonData {
                    let player1 = players.first(where: { $0.id == data.player1.id })
                    player1?.setScore(score: data.player1.score)
                    
                    let player2 = players.first(where: { $0.id == data.player2.id })
                    player2?.setScore(score: data.player2.score)
                    
                    let match = PlayerMatch(id: data.match,
                                            player1: player1,
                                            player2: player2)
                    
                    matches.append(match)
                }
                
            } catch {
                print("Failed to parse data")
            }
        }
    }
    
    private func getPoints(player: Player) -> Int {
        var points = 0
        for match in matches {
            guard let score1 = match.player1?.score, let score2 = match.player2?.score else { continue }
            
            if score1 < score2 && match.player2?.id == player.id {
                points += 3
            } else if score1 > score2 && match.player1?.id == player.id {
                points += 3
            } else if score1 == score2 && (match.player1?.id == player.id || match.player2?.id == player.id) {
                points += 1
            }
        }
        
        return points
    }
    
    private func getMatches(player: Player) -> [PlayerMatch] {
        return matches.filter( { $0.player1?.id == player.id || $0.player2?.id == player.id } )
    }
    
    func initialize() {
        for (i, player) in players.enumerated() {
            players[i].setPoints(points: getPoints(player: player))
            players[i].setMatches(matches: getMatches(player: player))
        }
    }
    
    func getPlayersByScore() -> [Player] {
        return players.sorted(by: { $0.score > $1.score })
    }
}
