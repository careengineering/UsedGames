//
//  ContentView.swift
//  UsedGames
//
//  Created by Çare C. on 9.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var gameStore = GameStore()
    
    @State var gameToDelete: Game?
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(gameStore.games) { (game) in
                    NavigationLink(destination: Text(game.name)) {
                        GameListItem(game: game)
                    }
                }
                .onDelete { indexSet in
                    //                gameStore.delete(at: indexSet) uyarı vermesi için değiştirildi
                    self.gameToDelete = gameStore.game(at: indexSet)
                }
                .onMove { indexSet, toOffset in
                    gameStore.move(indexSet: indexSet, to: toOffset)
                }
            }
            .listStyle(PlainListStyle())
            .animation(.easeIn, value: gameStore.games)
            
            .actionSheet(item:$gameToDelete) { (game) -> ActionSheet in
                
                ActionSheet(
                    title: Text("Are you sure?"),
                    message: Text("You will delete\(game.name)"),
                    buttons: [
                        .cancel(),
                        .destructive(
                            Text("Delete"),
                            action: {
                                if let indexSet = gameStore.indexSet(for: game) {
                                    gameStore.delete(at: indexSet)
                                }
                            })
                    ])
            }
            .navigationTitle("Used Games")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        gameStore.createGame()
                    } label: {
                        Text("Add")
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .accentColor(.red)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

