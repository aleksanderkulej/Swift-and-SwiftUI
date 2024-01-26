//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by AK Biznes on 10/01/2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    var color: UIColor?
    var advice: String?

    
    mutating func calculateBMI(height: Float, weight: Float) {
        let BMIValue = weight / pow(height, 2)
        
        
        getColor()
        getAdvice()
        
        bmi = BMI(value: BMIValue, advice: advice!, color: color!)


        
    }
    
    
    func getBMIValue() -> String {
        let BMIString = String(format: "%.1f", bmi?.value ?? 0.0)
        return BMIString
    }
    
    mutating func getColor() -> UIColor {
        if bmi?.value ?? 0.0 < 18.5 {
            color = UIColor.blue
        } else if bmi?.value ?? 0.0 < 24.9 {
            color = UIColor.green
        } else {
            color = UIColor.red
        }
        return color!
    }
    
    mutating func getAdvice() -> String {
        if bmi?.value ?? 0.0 < 18.5 {
            advice = "Eat more pies"
        } else if bmi?.value ?? 0.0 < 24.9 {
            advice = "Fit as a fiddle!"
        } else {
            advice = "Eat less pies!"
        }
        return advice!
    }

    
}
