//
//  RMCalculatorManager.swift
//  WorkoutRecord
//
//  Created by 정주호 on 01/12/2022.
//

import UIKit


struct RMCalculatorManager {
    

    private var rm: RM?
    

    mutating func getRM(reps: String, weight: String) -> RM {
        
        calculateRM(reps: reps, weight: weight)
        return rm ?? RM(mexWeight: 0.0)

    }
    
    mutating private func calculateRM(reps: String, weight: String) {
        guard let r = Double(reps), let w = Double(weight) else {
            rm = RM(mexWeight: 0.0)
            return
        }
        var rmNum = w + (w * r * 0.025)
        rm = RM(mexWeight: rmNum)
    }
    

    
}
