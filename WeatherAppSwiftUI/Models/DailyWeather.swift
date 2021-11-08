//
//  DailyWeather.swift
//  WeatherAppSwiftUI
//
//  Created by Daniel Golovin on 08.11.2021.
//

import Foundation
import SwiftUI

struct DailyWeather: Codable, Identifiable {
    let dt: Int
    let temp: Temperature
    let weather: [WeatherDetail]
    
    
    enum CodingCase: String {
        case dt
        case temp
        case weather
    }
    
    init() {
        dt = 0
        temp = Temperature(min: 0.0, max: 0.0)
        weather = [WeatherDetail(main: "", description: "", icon: "")]
    }
}

extension DailyWeather {
    var id: UUID {
        return UUID()
    }
}
