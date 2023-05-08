//
//  PlanetListView+ViewModel.swift
//  Planets
//
//  Created by Amit Vaidya on 07/05/2023.
//
//  ViewModel that handles network call using combine
//  If data isnt loaded then ProgressView() is shown to the user indicating that they need to wait
//  Also handled network errors and API errors
//  If URL is wrong a retry alert is shown to the users

import Foundation
import Combine

extension PlanetListView {
    class ViewModel: ObservableObject {
        
        @Published var response: [PlanetModel] = []
        @Published var hasError = false
        @Published var error: UserError?
        @Published private(set) var isRefreshing = false
        private var bag = Set<AnyCancellable>()
        
        func loadPlanets() {
            let planetUrlString = "https://swapi.dev/api/planets"
            if let url = URL(string: planetUrlString) {
                isRefreshing = true
                hasError = false
                
                URLSession
                    .shared
                    .dataTaskPublisher(for: url)
                    .receive(on: DispatchQueue.main)
                    .map(\.data)
                    .decode(type: PlanetResponse.self, decoder: JSONDecoder())
                    .map(\.results)
                    .sink { [weak self] result in
                        defer { self?.isRefreshing = false }
                        switch result {
                            case .failure(let error):
                                self?.hasError = true
                                self?.error = UserError.custom(error: error)
                            default: break
                        }
                        
                    } receiveValue: { [weak self] response in
                        self?.response = response // Set the array of planets to the response
                    }
                    .store(in: &bag)
            }
        }
    }
    
    enum UserError: LocalizedError {
        case failedToDecode
        case custom(error: Error)
        
        var errorDescription: String? {
            switch self {
                case .failedToDecode:
                    return "Failed to decode"
                case .custom(let error):
                    return error.localizedDescription
            }
        }
    }
}


