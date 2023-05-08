//
//  PlanetDetailView.swift
//  Planets
//
//  Created by Amit Vaidya on 07/05/2023.
//
//  Grouped Parameters of the planet to show case different properties obtained from planet model
//  Used SF symbols to show icons

import SwiftUI

struct PlanetDetailView:View {
    var planet: PlanetModel
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Welcome to \(planet.name)")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 10)
                PlanetImageView(url: planet.imageUrl, width: 320, height: 320, cornerRadius: 160)
                    .padding(.bottom, 10)
                Divider()
                    .padding([.leading, .trailing], 20)
                Group {
                    PlanetParameterCell(parameterSymbol: "rotate.3d", parameterName: "Rotation period", parameterValue: "\(planet.rotation_period)")
                    PlanetParameterCell(parameterSymbol: "speedometer", parameterName: "Orbital period", parameterValue: "\(planet.orbital_period)")
                    PlanetParameterCell(parameterSymbol: "circle.bottomhalf.filled", parameterName: "Diameter", parameterValue: "\(planet.diameter)")
                    PlanetParameterCell(parameterSymbol: "cloud.sun.bolt.circle", parameterName: "Climate", parameterValue: "\(planet.climate.capitalized)")
                    PlanetParameterCell(parameterSymbol: "leaf.circle", parameterName: "Gravity", parameterValue: "\(planet.gravity)")
                    PlanetParameterCell(parameterSymbol: "tent.circle", parameterName: "Terrain", parameterValue: "\(planet.terrain.capitalized)")
                    PlanetParameterCell(parameterSymbol: "drop.circle", parameterName: "Surface water", parameterValue: "\(planet.surface_water)")
                    PlanetParameterCell(parameterSymbol: "staroflife.circle", parameterName: "Population", parameterValue: "\(planet.population)")
                }
                Spacer()
            }
        }
    }
}
