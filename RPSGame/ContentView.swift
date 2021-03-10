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
    @State var handOne: handType = .rock
    @State var handTwo: handType = .rock
    let handImageName = ["rock", "scissors", "paper"]
    
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            Image(handImageName[handTwo.rawValue])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: 180))
                .padding(.bottom, 50)
            Text("じゃんけん、、、")
            Text(status)
            Image(handImageName[handOne.rawValue])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .padding()
            Picker("なにを出す？", selection: $handOne) {
                Text("グー").tag(handType.rock)
                Text("チョキ").tag(handType.scissors)
                Text("パー").tag(handType.paper)
            }
            Button(action: {
                battle()
            }) {
                Text("ポン！！")
            }
        }
    }
    
    func battle() {
        let handList = [handType.rock, handType.scissors, handType.paper]
        let randomInt = Int.random(in: 0...2)
        handTwo = handList[randomInt]
        
//        handOne - handTwoが「1 or -2」はPlayer1の勝ち、「0」はあいこ、「-1 ot 2」はPlayer2の勝ち
        let result: Int = handTwo.rawValue - handOne.rawValue
        
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

enum handType: Int {
    case rock = 0
    case scissors = 1
    case paper = 2
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
