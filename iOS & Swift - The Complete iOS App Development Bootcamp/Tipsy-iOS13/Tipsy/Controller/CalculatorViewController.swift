//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    
    var tipSelected = "10%"
    var peopleToSplit: Int = 2
    var amount = 0.0
    var stringAmount = ""
    var tip = 0.0

    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false

        sender.isSelected = true
        tipSelected = sender.titleLabel!.text!
        billTextField.endEditing(true)
    }
    

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        peopleToSplit = Int(sender.value)
        splitNumberLabel.text = "\(peopleToSplit)"

        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        amount = Double(billTextField.text!) ?? 0.0
        
        
        print(peopleToSplit)
        
        if tipSelected == "0%" {
            amount = amount / Double(peopleToSplit)
            
            tip = amount * tip
            amount = amount + tip
            print(amount)
        } else if tipSelected == "10%" {
            tip = 0.1
            amount = amount / Double(peopleToSplit)
            
            tip = amount * tip
            amount = amount + tip
            stringAmount = String(format: "%.2f", amount)

            print(amount)
        } else {
            tip = 0.2
            amount = amount / Double(peopleToSplit)
            print(amount)
            print(peopleToSplit)

            tip = amount * tip
            amount = amount + tip
            stringAmount = String(format: "%.2f", amount)
            
            print(amount)
            print(tip)

        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.totalLabelValue = stringAmount
            destinationVC.tip = tipSelected
            destinationVC.people = peopleToSplit

            
        }
    }
    
}

