//
//  PlanetModel.swift
//  Planets
//
//  Created by Amit Vaidya on 07/05/2023.
//
//  Model file for SWAPI API

import Foundation

class PlanetModel: Codable, Identifiable {
    
    let id: UUID
    let name: String
    let rotation_period: String
    let orbital_period: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surface_water: String
    let population: String
    let imageUrl: String // Random generated image url
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.rotation_period = try container.decodeIfPresent(String.self, forKey: .rotation_period) ?? ""
        self.orbital_period = try container.decodeIfPresent(String.self, forKey: .orbital_period) ?? ""
        self.diameter = try container.decodeIfPresent(String.self, forKey: .diameter) ?? ""
        self.climate = try container.decodeIfPresent(String.self, forKey: .climate) ?? ""
        self.gravity = try container.decodeIfPresent(String.self, forKey: .gravity) ?? ""
        self.terrain = try container.decodeIfPresent(String.self, forKey: .terrain) ?? ""
        self.surface_water = try container.decodeIfPresent(String.self, forKey: .surface_water) ?? ""
        self.population = try container.decodeIfPresent(String.self, forKey: .population) ?? ""
        self.imageUrl = "https://picsum.photos/seed/\(Int.random(in: 0...1000))"
    }
}

