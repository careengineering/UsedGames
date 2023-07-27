//
//  ContentView_withoutNavigation.swift
//  UsedGames
//
//  Created by Çare C. on 27.07.2023.
//

import SwiftUI

struct ContentView_withoutNavigation: View {
    @ObservedObject var gameStore = GameStore()
     
     @State var gameToDelete: Game?
     
     
     var body: some View {
         List {
             Color.barBackgroundColor.frame(width: nil, height: 44, alignment: .center)
             ForEach(gameStore.games) { (game) in
                 GameListItem(game: game)
             }
             .onDelete { indexSet in
 //                gameStore.delete(at: indexSet) uyarı vermesi için değiştirildi
                 self.gameToDelete = gameStore.game(at: indexSet)
             }
             .onMove { indexSet, toOffset in
                 gameStore.move(indexSet: indexSet, to: toOffset)
             }
         }
         .animation(.easeIn(duration: 200), value: gameStore.games)
         .overlay(
             VStack {
                 HStack {
                     EditButton()
                     Spacer()
                     Button {
                         gameStore.createGame()
                     } label: {
                         Text("Add")
                     }
                     .buttonStyle(BorderedButtonStyle())
                 }
                 .padding()
                 .background(
                     Color.barBackgroundColor
                         .edgesIgnoringSafeArea(.top)
                 )
             Spacer()
             }
         )
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
     }
}

struct ContentView_withoutNavigation_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_withoutNavigation()
    }
}
