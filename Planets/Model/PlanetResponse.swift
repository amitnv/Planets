//
//  PlanetResponse.swift
//  Planets
//
//  Created by Amit Vaidya on 07/05/2023.
//
//  Response Model file, data is stored under PlanetModel file

struct PlanetResponse: Codable {
    var next: String
    var results : [PlanetModel]
}
