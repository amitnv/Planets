//
//  PlanetImageView.swift
//  Planets
//
//  Created by Amit Vaidya on 07/05/2023.
//
//
//  Planet image view, can be customised based on cornerRadius and is randomised for every refresh.
//  Also includes a looping animation when tapped

import SwiftUI

struct PlanetImageView: View {
    let url: String
    let width: CGFloat
    let height: CGFloat
    let cornerRadius: CGFloat
    let rotation: Double = 360
    
    @ObservedObject var viewModel = ImageViewModel()
    @State var image: UIImage = UIImage()
    @State var show = false
    
    var body: some View {
        let finalizedUrl = "\(url)/\(Int(width))/\(Int(height))"
        
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width:width, height:height)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .shadow(radius: 4)
            .rotationEffect(Angle(degrees: show ? rotation : 0))
            .animation(.linear.repeatForever(), value: show)
            .onTapGesture { show.toggle() }
            .onReceive(viewModel.$image) { image in
                guard let image = image else { return }
                self.image = image
            }
            .onAppear { viewModel.loadImage(for: finalizedUrl) }
            .onDisappear(perform: viewModel.cancel)
    }
}
