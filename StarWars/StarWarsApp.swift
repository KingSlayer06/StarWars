//
//  StarWarsApp.swift
//  StarWars
//
//  Created by Himanshu Sherkar on 13/02/24.
//

import SwiftUI

@main
struct StarWarsApp: App {
    var body: some Scene {
        WindowGroup {
            StarWarsTournament()
                .environmentObject(StarWarsTournamentViewModel())
        }
    }
}
