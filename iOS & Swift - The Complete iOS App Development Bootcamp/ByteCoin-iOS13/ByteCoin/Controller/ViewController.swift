//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    
    
    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBOutlet weak var bitcoinLabel: UILabel!
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var coinManager = CoinManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        coinManager.delegate = self
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        

    }

}


//MARK: - CoinManagerDelegate

extension ViewController: CoinManagerDelegate {
    
    func didUpdateBitcoinRate(_ coinData: CoinData) {
            DispatchQueue.main.async {
                let rateString = coinData.rateString(rate: coinData.rate)
                self.bitcoinLabel.text = rateString
                self.currencyLabel.text = coinData.asset_id_quote
            }
        }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
    
}



//MARK: - UIPicker*

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currency = coinManager.currencyArray[row]
        
        let urlString = coinManager.getCoinPrice(for: currency)
            print(urlString)
        
        coinManager.performRequest(with: urlString)
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
}
