//
//  UserDefaultFunctions.swift
//  DiceRollDay95
//
//  Created by user256510 on 5/12/24.
//

import Foundation


func loadData() -> [Int]{
    if let list = UserDefaults.standard.array(forKey: "dice") as? [Int] {
        return list
    } else { return []}
}

func addToList(_ diceRoll: Int) {
    if var list = UserDefaults.standard.array(forKey: "dice") as? [Int] {
        list.append(diceRoll)
        UserDefaults.standard.setValue(list, forKey: "dice")
    } else {
        var list = [Int]()
        list.append(diceRoll)
        UserDefaults.standard.setValue(list, forKey: "dice")
    }
}

func save(_ rollList: [Int]) {
    UserDefaults.standard.setValue(rollList, forKey: "dice")
}
