//
//  GameStore.swift
//  UsedGames
//
//  Created by Çare C. on 9.07.2023.
//

import Foundation

class GameStore: ObservableObject {
    @Published var games: [Game] = []
// istediğin zaman tetiklenmesini istersen böyle yazılabilir
// her defasında trigger olsun istenirse başına published konur
//    {
//        didSet {
//            objectWillChange.send()
//        }
//    }
    
    init() {}
    
    
    @discardableResult func createGame() -> Game {
        
        let game = Game(random: true)
        games.append(game)
        return game
    }
    
    func delete(at indexSet: IndexSet) {
        games.remove(atOffsets: indexSet)
    }
    
    func move (indexSet: IndexSet, to toOffset: Int) {
        games.move(fromOffsets: indexSet, toOffset: toOffset)
    }
    
    func indexSet(for game: Game) ->IndexSet? {
        if let firstIndex = games.firstIndex(of: game) {
            return IndexSet(integer: firstIndex)
        } else {
            return nil
        }
    }
    
    func game(at indexSet: IndexSet) -> Game? {
        if let firstIndex = indexSet.first {
            return games[firstIndex]
        }
        return nil
    }
}
