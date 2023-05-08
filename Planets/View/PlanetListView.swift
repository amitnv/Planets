//
//  PlanetListView.swift
//  Planets
//
//  Created by Amit Vaidya on 07/05/2023.
//
//  Planet list View with interactible image and cells

import SwiftUI

struct PlanetListView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isRefreshing {
                    ProgressView()
                } else {
                    List(viewModel.response) { planet in
                        NavigationLink(
                            destination: PlanetDetailView(planet: planet),
                            label: {
                                HStack {
                                    PlanetImageView(url: planet.imageUrl, width: 80, height: 80, cornerRadius: 40)
                                    VStack(alignment: .leading) {
                                        Text(planet.name)
                                            .font(.title).bold()
                                            .padding(.leading, 8)
                                        Text("Explore the \(planet.terrain.capitalized) of \(planet.name)")
                                            .foregroundColor(.gray)
                                            .padding(.leading, 8)
                                    }
                                }
                            })
                    }
                }
            }
            .navigationBarTitle("Explore Planets") // Sets a main screen title
        }
        .onAppear(perform: viewModel.loadPlanets)
        .alert(isPresented: $viewModel.hasError,
               error: viewModel.error) {
            Button(action: viewModel.loadPlanets) {
                Text("Please retry") //Appears on unstable data or bad request
            }
        }
        .navigationViewStyle(.stack)
    }
}
