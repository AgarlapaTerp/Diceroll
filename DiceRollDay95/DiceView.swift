//
//  DiceView.swift
//  DiceRollDay95
//
//  Created by user256510 on 5/12/24.
//

import SwiftUI

struct DiceView: View {
    
    let possibleDice = [4,6,8,10,12,20,100]
    @State private var sidedDice = 6
    @State private var diceRoll: Int = 1
    @State private var startRoll = false
    
    @State private var i = 0
    
    let timer = Timer.publish(every: 0.25,tolerance: 0.2, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            Text("Dice Roll")
                .fontWeight(.semibold)
                .font(.largeTitle)
            
            Picker("Customize Dice", selection: $sidedDice) {
                ForEach(possibleDice, id: \.self) {
                    Text($0.formatted())
                }
            }
            .padding(.horizontal, 50)
            .pickerStyle(.palette)
            
            ZStack {
                Image(.dice)
                
                Text(diceRoll.formatted())
                    .font(.title)
                    .fontWeight(.bold)
            }
            .onTapGesture {
                rollDice()
            }
            .sensoryFeedback(.impact(flexibility: .soft, intensity: 0.7), trigger: startRoll)
            .onReceive(timer) { input in
                if startRoll {
                    diceRoll = Int.random(in: 1..<sidedDice+1)
                    i+=1
                    if i == 5 {
                        addToList(diceRoll)
                        i = 0
                        startRoll = false
                    }
                }
            }
            .accessibilityAddTraits(.isButton)
            .accessibilityLabel("Rolled a \(diceRoll)")
                
        }
    }
    
    func rollDice() {
        startRoll = true
    }
    
    
}

#Preview {
    DiceView()
}
