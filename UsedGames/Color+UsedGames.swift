//
//  Color+UsedGames.swift
//  UsedGames
//
//  Created by Çare C. on 26.07.2023.
//

import SwiftUI

extension Color {

    // burada renkler tanımlanır
    private static var usedGamesWhite: Color {
        return Color("UsedGamesWhite")
    }
    
    
    //burada objeye atanırsa daha anlaşılır olur
    static var barBackgroundColor: Color {
        return usedGamesWhite
    }
}


