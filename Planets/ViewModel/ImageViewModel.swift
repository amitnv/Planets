//
//  ImageViewModel.swift
//  Planets
//
//  Created by Amit Vaidya on 07/05/2023.
//
//  Loads image using Combine

import SwiftUI
import Combine

class ImageViewModel: ObservableObject {
    @Published var image: UIImage?
    private var cancellable: AnyCancellable?
    
    func loadImage(for urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        cancellable = URLSession
            .shared
            .dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .map{ UIImage(data: $0.data) }
            .replaceError(with: nil)
            .assign(to: \.image, on: self)
        
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}
