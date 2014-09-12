//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by bondgeek on 9/12/14.
//  Copyright (c) 2014 bondgeek. All rights reserved.
//

import Foundation

class TipCalculatorModel {
    var total: Double
    var taxPct: Double
    
    var subtotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }
    
    init(total:Double, taxPct:Double) {
        self.total = total
        self.taxPct = taxPct
    }
    
    func calcTipWithTipPct(tipPct:Double) -> Double {
        return subtotal * tipPct
    }
    
    func returnPossibleTips() -> [Int: Double] {
        let suggestTipPct = [0.15, 0.18, 0.20]
        
        var result = Dictionary<Int, Double>()
        for tip in suggestTipPct {
            let intPct = Int(tip * 100)
            result[intPct] = calcTipWithTipPct(tip)
        }
        return result
    }
}