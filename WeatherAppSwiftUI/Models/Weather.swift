//
//  Weather.swift
//  WeatherAppSwiftUI
//
//  Created by Daniel Golovin on 08.11.2021.
//

import Foundation

struct Weather: Codable, Identifiable {
    let dt: Int
    let temp: Double
    let feels_like: Double
    let pressure: Int
    let humidity: Int
    let dew_point: Double
    let clouds: Int
    let wind_speed: Double
    let wind_deg: Int
    let weather: [WeatherDetail]
    
    enum CodingKey: String {
        case dt
        case temp
        case feels_like
        case pressure
        case humidity
        case dew_point
        case clouds
        case wind_speed
        case wind_deg
        case weather
    }
    init() {
        dt = 0
        temp = 0.0
        feels_like = 0.0
        pressure = 0
        humidity = 0
        dew_point = 0.0
        clouds = 0
        wind_speed = 0.0
        wind_deg = 0
        weather = []
    }
    
}

extension Weather {
    var id: UUID {
        return UUID()
    }
}



