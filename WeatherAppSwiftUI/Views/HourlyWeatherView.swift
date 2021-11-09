//
//  HourlyWeatherView.swift
//  WeatherAppSwiftUI
//
//  Created by Daniel Golovin on 08.11.2021.
//

import SwiftUI

struct HourlyWeatherView: View {
    
    @ObservedObject var cityVM: CityViewViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(cityVM.weather.hourly) { weather in
                    let icon = cityVM.getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sum.max.fill")
                    let hour = cityVM.getTimeFor(timestamp: weather.dt)
                    let temp = cityVM.getTempFor(temp: weather.temp)
                    getHourly(hour: hour, image: icon, temp: temp)
                }
            }
        }
    }
    
    private func getHourly(hour: String, image: Image, temp: String) -> some View {
        VStack(spacing: 20) {
            Text(hour)
            image
                .foregroundColor(.yellow)
            Text(temp)
        }
        .foregroundColor(.white)
        .padding()
        .background(RoundedRectangle(cornerRadius: 5).fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6050886512, green: 0.8078318238, blue: 0.9820488095, alpha: 1)), Color(#colorLiteral(red: 0.4927079082, green: 0.6170794964, blue: 0.9508995414, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)))
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 2, y: 2)
    }
}

struct HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
