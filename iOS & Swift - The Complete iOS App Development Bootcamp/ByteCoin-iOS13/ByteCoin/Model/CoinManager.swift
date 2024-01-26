//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateBitcoinRate(_ coinData: CoinData)
    func didFailWithError(_ error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "B07032BF-D160-4941-BEA3-DC23DC894A63"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    
    var delegate: CoinManagerDelegate?

    
    func getCoinPrice(for currency: String) -> String {
        let urlString = baseURL+"/\(currency)?apikey="+apiKey
        
        return urlString
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    self.delegate?.didFailWithError(error)
                                  return
                }
                if let safeData = data {
                    if let coinData = parseJSON(safeData) {
                        // Now you can work with coinData
                        self.delegate?.didUpdateBitcoinRate(coinData)

                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ coinData: Data) -> CoinData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            return decodedData
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }
    
    
    
}
