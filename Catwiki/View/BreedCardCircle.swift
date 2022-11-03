//
//  BreedCardCircle.swift
//  Catwiki
//
//  Created by  Mr.Ki on 30.08.2022.
//


import SwiftUI

struct BreedCardCircle: View {
    @Environment (\.managedObjectContext) var managedObjectContext
 
    let breed: Breed
    let imageSize: CGFloat =  UIScreen.main.bounds.height / 6
    let scale: CGFloat = 0.7
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                
                if let url = breed.image?.url {
                    AsyncImage(url: URL(string: url)) { phase in
                        if let image = phase.image {
                            ZStack {
                                Circle()
                                    .foregroundColor(Color("ColorTab"))
                                    .scaleEffect(scale + 0.1)
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: imageSize)
                                    .background(Color("ColorTabLight"))
                                    .clipShape(Circle())
                                    .saturation(0.5)
                                    .scaleEffect(scale)
                            }
                        } else if phase.error != nil {
                            ZStack {
                                Circle()
                                    .foregroundColor(Color("ColorTab"))
                                    .scaleEffect(scale + 0.1)
                                Color.red.frame(width: imageSize)
                                    .clipShape(Circle())
                                    .saturation(0.5)
                                    .scaleEffect(scale)
                                Text("❌")
                                    .font(.system(size: 70))
                                    .scaledToFit()
                                    .frame(width: imageSize)
                            }
                        } else {
                            ZStack {
                            Circle()
                                .foregroundColor(Color("ColorTab"))
                                .scaleEffect(scale + 0.1)
                            ProgressView()
                                .frame(width: imageSize)
                            }
                        }
                    }
                } else {
                    ZStack {
                        Circle()
                            .foregroundColor(Color("ColorTab"))
                            .scaleEffect(scale + 0.1)
                        Color.gray.frame(width: imageSize)
                            .clipShape(Circle())
                            .saturation(0.5)
                            .scaleEffect(scale)
                        Text("🐱")
                            .font(.system(size: 70))
                            .scaledToFit()
                            .frame(width: imageSize)
                    }
                }
            }
            .frame(width: imageSize, height: imageSize)
        }
        .shadow(color: Color("ColorLightShadow"), radius: 10, x: 1, y: 1)
        .opacity(5)
    }
}

struct ProductCardCircle_Previews: PreviewProvider {
    static var previews: some View {
        BreedCardCircle(breed: Breed.example1())
            .previewLayout(.fixed(width: 300, height: 200))
    }
}
