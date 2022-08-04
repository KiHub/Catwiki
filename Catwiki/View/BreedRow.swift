//
//  BreedRow.swift
//  Catwiki
//
//  Created by  Mr.Ki on 04.08.2022.
//

import SwiftUI

struct BreedRow: View {
    let breed: Breed
    let imageSize: CGFloat = 100
    @State private var scale: CGFloat = 0.9
    var body: some View {
        HStack {
            
            if let url = breed.image?.url {
                AsyncImage(url: URL(string: url)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                            .clipped()
                            .shadow(color: .gray, radius: 10, x: 5, y: 5)
                            .saturation(0.5)
                            .scaleEffect(scale)
                    } else if phase.error != nil {
                        ZStack {
                        Color.red.frame(width: imageSize, height: imageSize)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                            .shadow(color: .gray, radius: 10, x: 5, y: 5)
                            .saturation(0.5)
                            .scaleEffect(scale)
                        Text("❌")
                            .frame(width: imageSize, height: imageSize)
                            .font(.system(size: 70))
                            .scaledToFill()
                        }
                    } else {
                       ProgressView()
                            .frame(width: imageSize, height: imageSize)
                    }
                }
            } else {
                ZStack {
                Color.gray.frame(width: imageSize, height: imageSize)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .shadow(color: .gray, radius: 10, x: 5, y: 5)
                    .saturation(0.5)
                    .scaleEffect(scale)
                    Text("🐱")
                        .font(.system(size: 70))
                        .scaledToFill()
                    .frame(width: imageSize, height: imageSize)
                }
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(breed.name)
                    .font(.headline)
                Text(breed.temperament)
            }
        }
    }
}

struct BreedRow_Previews: PreviewProvider {
    static var previews: some View {
        BreedRow(breed: Breed.example1())
            .previewLayout(.fixed(width: 300, height: 200))
    }
}
