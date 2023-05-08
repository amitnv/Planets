//
//  PlanetParameterCell.swift
//  Planets
//
//  Created by Amit Vaidya on 07/05/2023.
//
//  Base Cell like UI to showcase different properties of the planet

import SwiftUI

struct PlanetParameterCell: View {
    let parameterSymbol: String
    let parameterName: String
    let parameterValue: String
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image(systemName: "\(parameterSymbol)")
                    .font(.system(size: 30))
                    .padding(8)
                    .foregroundColor(.white)
                VStack(alignment: .leading) {
                    Text("\(parameterName)")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.leading, 10)
                    Text("\(parameterValue)")
                        .foregroundColor(.white)
                        .padding(.leading, 10)
                        .font(.headline)
                }
            }
        }
        .background(Color(UIColor.lightGray))
        .cornerRadius(20)
        .padding([.leading, .trailing], 20)
    }
}
