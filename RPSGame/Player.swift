//
//  Player.swift
//  RPSGame
//
//  Created by 髙木文弘 on 2021/03/08.
//

import Foundation

class Player: ObservableObject {
    @Published var hand: String
    @Published var status: String
    
    init(hand: String = "", status: String = "") {
        self.hand = hand
        self.status = status
    }
}
