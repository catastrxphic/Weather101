//
//  WeatherView.swift
//  Weather101
//
//  Created by Cami🦋 on 9/17/22.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading,spacing: 5){
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute().second()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack{
                    HStack{
                        
                        VStack(spacing:20){
                            Image(systemName: "sun.max")
                            .font(.system(size: 40))
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundedDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height:0)
                    AsyncImage(url:URL( string: "https://www.pngkey.com/png/full/905-9055849_atmosphere-of-earth-m-transparent-background-earth.png")){ image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                  Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                Spacer()
                
                VStack(alignment: .leading, spacing: 20){
                    Text("Weather now")
                        .bold().padding(.bottom )
                    
                    HStack{
                        WeatherRow(logo: "thermometer", name: "min temp", value: weather.main.tempMin.roundedDouble() + "°")
                        
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "max temp", value: weather.main.tempMax.roundedDouble() + "°")
                    }
                    
                    HStack{
                        WeatherRow(logo: "wind", name: "wind speed", value: weather.wind.speed.roundedDouble() + "m/s")
                        
                        Spacer()
                        WeatherRow(logo: "humidity", name: "humidity", value: weather.main.humidity.roundedDouble() + "%")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom ,20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(Color(hue: 0.58, saturation: 0.12, brightness: 0.53))
                .cornerRadius( 20, corners: [.topLeft, .topRight])
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.94, saturation: 0.04, brightness: 0.71))
        .preferredColorScheme(.dark)
        
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
