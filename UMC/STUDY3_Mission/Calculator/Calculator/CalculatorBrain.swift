//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by 최영우 on 5/4/23.
//

import Foundation

func rest(op1 : Double)-> Double {
    return op1 * 0.01
}

func div(op1 : Double, op2 : Double)-> Double {
    return op1 / op2
}

func cross(op1 : Double, op2 : Double)-> Double {
    return op1 * op2
}

func minus(op1 : Double, op2 : Double)-> Double {
    return op1 - op2
}

func plus(op1 : Double, op2 : Double)-> Double {
    return op1 + op2
}

class CalculatorBrain {
    
    private var accumulator = 0.0
    
    func setOperation(operand : Double) {
        accumulator = operand
    }
}
