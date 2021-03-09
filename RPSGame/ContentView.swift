//
//  ContentView.swift
//  RPSGame
//
//  Created by 髙木文弘 on 2021/03/08.
//

import SwiftUI

struct ContentView: View {
    @State var status: String = ""
//    0: グー、1: チョキ、2: パー
    @State var handOne: Int = 0
    @State var handTwo: Int = 0
    let handImageName = ["rock", "scissors", "paper"]
    
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            Image(handImageName[handTwo])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: 180))
                .padding(.bottom, 50)
            Text("じゃんけん、、、")
            Text(status)
            Image(handImageName[handOne])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .padding()
            Picker("なにを出す？", selection: $handOne) {
                Text("グー").tag(0)
                Text("チョキ").tag(1)
                Text("パー").tag(2)
            }
            Button(action: {
                battle()
            }) {
                Text("ポン！！")
            }
        }
    }
    
    func battle() {
        handTwo = Int.random(in: 0..<3)
        
        if handOne == handTwo {
            status = "あいこ"
        } else if handOne == 0 {
            if handTwo == 1 {
                status = "勝ち"
            } else {
                status = "負け"
            }
        } else if handOne == 1 {
            if handTwo == 2 {
                status = "勝ち"
            } else {
                status = "負け"
            }
        } else if handOne == 2 {
            if handTwo == 0 {
                status = "勝ち"
            } else {
                status = "負け"
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
