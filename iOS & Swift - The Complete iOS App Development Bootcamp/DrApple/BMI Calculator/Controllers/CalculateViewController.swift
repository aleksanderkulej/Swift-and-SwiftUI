//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var wieghtLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    var calculatorBrain = CalculatorBrain()
    
    @IBAction func heightSliderChange(_ sender: UISlider) {
        let value = sender.value
        let roundedHeight = round(value * 100) / 100
        heightLabel.text = String(roundedHeight) + "m"
    }
    
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        let value = sender.value
        let roundedValue = round(value)
        let roundedInt = Int(roundedValue)
        wieghtLabel.text = String(roundedInt) + "Kg"
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let height = heightSlider.value
        let weight = weightSlider.value
        
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            
            
            
            let bmiValue = calculatorBrain.getBMIValue()
            destinationVC.bmiValue = bmiValue
            
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()

            
            
        }
    }
    
}

