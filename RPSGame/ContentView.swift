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
        
//        handOne - handTwoが「1 or -2」はPlayer1の勝ち、「0」はあいこ、「-1 ot 2」はPlayer2の勝ち
        let result: Int = handTwo - handOne
        
        switch result {
        case 0:
            status = "あいこ"
        case -2, 1:
            status = "勝ち"
        case -1, 2:
            status = "負け"
        default:
            break
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
