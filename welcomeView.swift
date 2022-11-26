//
//  WelcomeView.swift
//  Weather101
//
//  Created by Cami🦋 on 9/15/22.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack{
            VStack( spacing : 20){
                Text("Welcome to the weather app").bold().font(.title).foregroundColor(.init(hue: 0.45, saturation: 0.13, brightness: 0.33))
                Text("Please share your current location to get the weather on your area").padding().foregroundColor(.init(hue: 0.63, saturation: 0.02, brightness: 0.10))
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(50)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
