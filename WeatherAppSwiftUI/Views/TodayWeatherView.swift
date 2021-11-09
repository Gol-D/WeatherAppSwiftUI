//
//  TodayWeatherView.swift
//  WeatherAppSwiftUI
//
//  Created by Daniel Golovin on 08.11.2021.
//

import SwiftUI

struct TodayWeatherView: View {
    
    @ObservedObject var cityVM: CityViewViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Today")
                .font(.largeTitle)
                .bold()
            
            HStack(spacing: 20) {
                LottieView(name: cityVM.getLottieAnimationFor(icon: cityVM.wetherIcon))
                    .frame(width: 100, height: 100)
                
                VStack(alignment: .leading) {
                    Text("\(cityVM.temperature)℃")
                        .font(.system(size: 42))
                    Text(cityVM.conditions)
                }
            }
            
            HStack {
                Spacer()
                widgerView(image: "wind", collor: .green, titel: "\(cityVM.windSpeed)м/ч")
                Spacer()
                widgerView(image: "drop.fill", collor: .blue, titel: "\(cityVM.humidity)")
                Spacer()
                widgerView(image: "umbrella.fill", collor: .red, titel: "\(cityVM.rainChances)")
                Spacer()
            }
        }
        .padding()
        .foregroundColor(.white)
        .background(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.blue]), startPoint: .top, endPoint: .bottom)).opacity(0.3))
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 2, y: 2)
    }
    
    private func widgerView(image: String, collor: Color, titel: String) -> some View {
        VStack {
            Image(systemName: image)
                .padding()
                .font(.title)
                .foregroundColor(collor)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
            
            Text(titel)
        }
    }
}

struct TodayWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
