//
//  WeatherModel.swift
//  Clima
//
//  Created by AK Biznes on 13/01/2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let weatherId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)

    }
    
    var conditionName: String {
        let id = String(weatherId)
        
        if id.first == "2" {
            return "cloud.bolt"
        } else if id.first == "3" {
            return "cloud.drizzle"
        } else if id.first == "5" {
            return "cloud.rain"
        } else if id.first == "6" {
            return "cloud.snow"
        } else if id.first == "7" {
            return "smoke"
        } else if id == "800" {
            return "sun.max"
        } else {
            return "cloud"
        }
    }
    
   
    
}
