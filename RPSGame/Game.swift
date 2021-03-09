//
//  rps.swift
//  RPSGame
//
//  Created by 髙木文弘 on 2021/03/08.
//

import Foundation

class Game: ObservableObject {
    @Published var handOne: String
    @Published var handTwo: String
    @Published var status: String
    
    init(handOne: String = "グー", handTwo: String = "グー", status: String = "") {
        self.handOne = handOne
        self.handTwo = handTwo
        self.status = status
    }
    
    func Battle(handOne: String, handTwo: String) {
        self.handOne = handOne
        self.handTwo = handTwo
        
        if self.handOne == self.handTwo {
            self.status = "あいこ"
        } else if self.handOne == "グー" {
            if self.handTwo == "チョキ" {
                self.status = "勝ち"
            } else {
                self.status = "負け"
            }
        } else if self.handOne == "チョキ" {
            if self.handTwo == "パー" {
                self.status = "勝ち"
            } else {
                self.status = "負け"
            }
        } else if self.handOne == "パー" {
            if self.handTwo == "グー" {
                self.status = "勝ち"
            } else {
                self.status = "負け"
            }
        }
    }
}
