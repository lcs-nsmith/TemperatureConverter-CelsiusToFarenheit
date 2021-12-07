//
//  CelsiusToFahrenheitView.swift
//  TemperatureConverter-CelsiusToFarenheit
//
//  Created by Nate S on 2021-12-02.
//

import SwiftUI

struct CelsiusToFahrenheitView: View {
    
    @State var temperatureInCelsius: Double = -6.5
    
    var temperatureInFahrenheit: Double {
        return (temperatureInCelsius * 1.8)+32.0
    }
    
    var vetementSuggestions: String {
        switch temperatureInCelsius {
        case ...(-50):
            return "Don't go outside, It's too cold!"
        case -50...(-30):
            return "Dress as warmly as you possibly can!"
        case -30...(-10):
            return "Dress extremely warmly!"
        case -10...0:
            return "Put on a coat!"
        case 0...10:
            return "Wear a sweater or a hoodie!"
        case 10...15:
            return "Its the perfect temperature!"
        case 15...20:
            return "It's t-shirt weather!"
        case 20...35:
            return "Its hot outside!"
        default:
            return "Its really hot out! Try to stay inside, but if you have to go outside; stay in the shade!"
        }
    }
    
    var body: some View {
        return VStack (alignment: .leading) {
            Text("Celsius")
                .fontWeight(.bold)
                .padding(.top)
            
            Slider(value: $temperatureInCelsius,
                   in: -63.0...50.0,
                   step: 0.5,
                   label: {
                Text("Celsius Slider")
            },
                   minimumValueLabel: {
                Text("-63°C")
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
            },
                   maximumValueLabel: {
                Text("50°C")
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
            })
            HStack {
                Spacer()
                Text("\(String(format: "%.1f", temperatureInCelsius))")
                    .font(.system(size: 25, weight: .medium , design: .rounded))
                Spacer()
            }
            Text("Fahrenheit")
                .fontWeight(.bold)
                .padding(.top)
            
            HStack {
                Spacer()
                Text("\(String(format: "%.1f", temperatureInFahrenheit))")
                    .font(.system(size: 25, weight: .medium , design: .rounded))
                Spacer()
            }
            HStack {
                Spacer()
                Text(vetementSuggestions)
                    .font(.system(size: 25, weight: .thin , design: .rounded))
                Spacer()
            }
            .padding(.vertical)
            Spacer()
        }
        .padding(.horizontal)
        .navigationTitle("Temperature Converter")
        
    }
}

struct CelsiusToFahrenheitView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CelsiusToFahrenheitView()
        }
    }
}
