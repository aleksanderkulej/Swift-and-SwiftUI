//
//  WeatherManagerDelegate.swift
//  Clima
//
//  Created by AK Biznes on 13/01/2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

let weatherD = WeatherManager()


protocol didUpdateWeather {
    func checkWeather()
}

func checkWeather() {
    weatherD.parseJSON(weatherData)
}

struct WeatherManagerDelegate {
     
}
