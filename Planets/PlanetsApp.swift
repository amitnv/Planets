//
//  PlanetsApp.swift
//  Planets
//
//  Created by Amit Vaidya on 07/05/2023.
//
//  Main file that shows SwiftUI lifecycle
//  This app is fully compatible with dark mode and requires iOS 15 and above

import SwiftUI

@main
struct PlanetsApp: App {
    
    var body: some Scene {
        WindowGroup {
            PlanetListView(viewModel: PlanetListView.ViewModel())
        }
    }
}
