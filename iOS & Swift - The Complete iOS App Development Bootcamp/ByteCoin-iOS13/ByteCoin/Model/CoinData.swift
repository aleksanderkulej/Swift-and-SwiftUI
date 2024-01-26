//
//  CoinData.swift
//  ByteCoin
//
//  Created by AK Biznes on 18/01/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    let rate: Float
    let asset_id_quote: String

    func rateString(rate: Float) -> String {
        let rateString = String(format: "%.2f", rate)
        return rateString
    }
    
}
