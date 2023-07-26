//
//  GameListItem.swift
//  UsedGames
//
//  Created by Çare C. on 26.07.2023.
//

import SwiftUI

struct GameListItem: View {
    
    var game : Game
    var dollarFormatter : NumberFormatter = Formatters.dollarFormatter
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 4.0) {
                Text(game.name)
                    .font(.body)
                Text(game.serialNumber)
                    .font(.caption)
                    .foregroundColor(Color(white: 0.65))
            }
            Spacer()
            Text(NSNumber(value: game.priceInDollars), formatter: dollarFormatter)
                .font(.title2)
                .foregroundColor(game.priceInDollars > 30 ? .blue : .gray)
                .animation(nil)
        }
        .padding(.vertical, 6)
    }
}

struct GameListItem_Previews: PreviewProvider {
    static var previews: some View {
        
        let item = GameListItem(game: Game(random: true))
            .padding(.horizontal)
            .previewLayout(.sizeThatFits)
        
        
        Group {
            item
            
            item
            .preferredColorScheme(.dark)
            
            item
            .environment(
                \.sizeCategory,
                .accessibilityExtraExtraExtraLarge)
            
            item
            .environment(
                \.locale,
                Locale(identifier: "tr")
            )
        }
    }
}
