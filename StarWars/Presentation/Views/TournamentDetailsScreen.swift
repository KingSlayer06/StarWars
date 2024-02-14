//
//  TournamentDetailsScreen.swift
//  StarWars
//
//  Created by Himanshu Sherkar on 13/02/24.
//

import SwiftUI

struct TournamentDetailsScreen: View {
    @EnvironmentObject var starWarsTournamentVM: StarWarsTournamentViewModel
    var player: Player
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Text("Matches")
                    .font(.title3.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                
                ForEach(player.matches, id: \.id) { match in
                    HStack {
                        Text(match.player1?.name ?? "")
                            .font(.title2)
                        
                        Spacer()
                        
                        Text("\(match.player1?.score ?? 0)-\(match.player2?.score ?? 0)")
                        
                        Spacer()
                        
                        Text(match.player2?.name ?? "")
                            .font(.title2)
                    }
                    .padding()
                    .background(getColor(match: match))
                }
            }
        }
        .navigationTitle(player.name)
    }
    
    func getColor(match: PlayerMatch) -> Color {
        guard let score1 = match.player1?.score, let score2 = match.player2?.score else { return .red }
        
        if score1 < score2 && match.player2?.id == player.id {
            return .green
        } else if score1 > score2 && match.player1?.id == player.id {
            return .green
        } else if score1 == score2 {
            return .white
        }
        
        return .red
    }
}

#Preview {
    TournamentDetailsScreen(player: Player(id: 0, name: "", icon: "", score: 0, points: 0))
        .environmentObject(StarWarsTournamentViewModel())
}
