//
//  ResultsView.swift
//  DiceRollDay95
//
//  Created by user256510 on 5/12/24.
//

import SwiftUI

struct ResultsView: View {
    @State private var diceRolls: [Int] = loadData()
    var body: some View {
        VStack {
            Text("Total: \(findTotal())")
            List {
                ForEach(diceRolls.indices, id: \.self){ index in
                    Text(diceRolls[index].formatted())
                        .swipeActions(edge: .trailing){
                            Button(role: .destructive) {
                                diceRolls.remove(at: index)
                                save(diceRolls)
                            }label: {
                                Label("Delete", systemImage: "trash.fill")
                            }
                        }
                }
            }
        }
        .onAppear(perform: {
            diceRolls = loadData()
        })
        
        
        
    }
    
    func findTotal() -> Int {
        let total = diceRolls.reduce(0) { $0 + $1}
        return total
    }
    
    
}

#Preview {
    ResultsView()
}
