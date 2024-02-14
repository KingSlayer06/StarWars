//
//  StarWarsTournament.swift
//  StarWars
//
//  Created by Himanshu Sherkar on 13/02/24.
//

import SwiftUI
import Kingfisher

struct StarWarsTournament: View {
    @EnvironmentObject var starWarsTournamentVM: StarWarsTournamentViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Points Table")
                        .font(.title3.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                    
                    ForEach(starWarsTournamentVM.getPlayersByScore(), id: \.id) { player in
                        NavigationLink {
                            TournamentDetailsScreen(player: player)
                        } label: {
                            HStack {
                                KFImage(URL(string: player.icon))
                                    .placeholder {
                                        Color.red
                                    }
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                
                                Text("\(player.name)")
                                    .font(.title2)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Text("\(player.points)")
                                    .font(.title.bold())
                                    .foregroundColor(.black)
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
                .navigationTitle("Star Wars Blaster Tournament")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    StarWarsTournament()
        .environmentObject(StarWarsTournamentViewModel())
}
