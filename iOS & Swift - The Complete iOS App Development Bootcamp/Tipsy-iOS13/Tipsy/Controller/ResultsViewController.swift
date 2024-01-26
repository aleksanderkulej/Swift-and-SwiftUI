//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by AK Biznes on 11/01/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

   
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var detailsLabel: UILabel!
    var totalLabelValue: String = ""
    var tip = ""
    var people = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountLabel.text = totalLabelValue
        detailsLabel.text = "Split between \(people) people, with \(tip) tip."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true)

        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
