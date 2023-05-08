//
//  MockAPIService.swift
//  Planets
//
//  Created by Amit Vaidya on 07/05/2023.
//
//  Mock APIService to test the API call

import Foundation
import Combine

// Error enum
enum MockAPIError: Error {
    case networkError(description: String)
    case responseError(description: String)
    case unknownError(description: String)
}

// APIService
/**
 This handle all the async data fetch functionalities with reactive manner by using Combine
 */
class MockAPIService: ObservableObject {
    @Published var response = [PlanetModel]()
    @Published var errorMessage: String?
    
    private var publisherRequest: Cancellable? {
        didSet {oldValue?.cancel() }
    }
    
    // Deallocate with cancel the subscription and release the memory
    deinit {
        publisherRequest?.cancel()
    }
    
    // Load the star wars planets form the swapi
    func loadPlanets() -> AnyPublisher<[PlanetModel], Error> {
        let url = URL(string: "https://swapi.dev/api/planets")
        
        let publisher = URLSession.shared.dataTaskPublisher(for: url!)
            .retry(3) // If request fail for any circumstance, Retry 3 times
            .mapError { error -> Error in
                // Handle Network errors
                switch error {
                case URLError.cannotFindHost:
                    return MockAPIError.networkError(description: error.localizedDescription)
                default:
                    return MockAPIError.unknownError(description: error.localizedDescription)
                }
            }
            .map(\.data)
            .decode(type: PlanetResponse.self, decoder: JSONDecoder())
            .map(\.results) // Map PlanetResponse results
            .mapError { error -> Error in
                // Handle JSONDecode errors
                switch error {
                case DecodingError.keyNotFound, DecodingError.typeMismatch:
                    return MockAPIError.responseError(description: error.localizedDescription)
                default:
                    return MockAPIError.unknownError(description: error.localizedDescription)
                }
            }
            .eraseToAnyPublisher()
        
        self.publisherRequest = publisher.receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { value in
                    switch value {
                    case .finished:
                        print("API Fetch Done.")
                    case .failure(let error):
                        print(error);
                        self.errorMessage = error.localizedDescription;
                    }
            }, receiveValue: {data in
                self.response = data // Set the array of planets to the response
            })
        
        return publisher
    }
}
