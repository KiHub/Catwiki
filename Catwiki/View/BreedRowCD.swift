//
//  BreedRowCD.swift
//  Catwiki
//
//  Created by  Mr.Ki on 20.08.2022.
//

import SwiftUI

struct BreedRowCD: View {
    let breed: FetchedResults<Item>.Element
    let imageSize: CGFloat = 100
    let scale: CGFloat = 0.9
    var body: some View {
        HStack {
            
            if let url = breed.image {
                AsyncImage(url: URL(string: url)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                            .clipped()
                            .shadow(color: Color("ColorTab"), radius: 10, x: 5, y: 5)
                            .saturation(0.5)
                            .scaleEffect(scale)
                    } else if phase.error != nil {
                        ZStack {
                            Color.red.frame(width: imageSize, height: imageSize)
                                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                .shadow(color: Color("ColorTab"), radius: 10, x: 5, y: 5)
                                .saturation(0.5)
                                .scaleEffect(scale)
                            Text("❌")
                                .font(.system(size: 70))
                                .scaledToFill()
                                .frame(width: imageSize, height: imageSize)
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
                        .shadow(color: Color("ColorTab"), radius: 10, x: 5, y: 5)
                        .saturation(0.5)
                        .scaleEffect(scale)
                    Text("🐱")
                        .font(.system(size: 70))
                        .scaledToFill()
                        .frame(width: imageSize, height: imageSize)
                }
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(breed.name ?? "Error")
                    .font(.headline)
                Text(breed.temperament ?? "Error")
            }
        }
    }
}

