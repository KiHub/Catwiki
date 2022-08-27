//
//  BreedCard.swift
//  Catwiki
//
//  Created by  Mr.Ki on 05.08.2022.
//

import SwiftUI

struct BreedCard: View {
    @Environment (\.managedObjectContext) var managedObjectContext
    
    let breed: Breed
    let imageSize: CGFloat = 180
    let scale: CGFloat = 0.9
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                
                if let url = breed.image?.url {
                    AsyncImage(url: URL(string: url)) { phase in
                        if let image = phase.image {
                            image.resizable()
                                .scaledToFill()
                                .frame(width: imageSize)
                                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                .clipped()
                           //     .shadow(color: .gray, radius: 5, x: 1, y: 1)
                                .saturation(0.5)
                                .scaleEffect(scale)
                        } else if phase.error != nil {
                            ZStack {
                                Color.red.frame(width: imageSize)
                                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                    .shadow(color: .gray, radius: 5, x: 1, y: 1)
                                    .saturation(0.5)
                                    .scaleEffect(scale)
                                Text("❌")
                                    .font(.system(size: 70))
                                    .scaledToFill()
                                    .frame(width: imageSize)
                            }
                        } else {
                            ProgressView()
                                .frame(width: imageSize)
                        }
                    }
                } else {
                    ZStack {
                        Color.gray.frame(width: imageSize)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                            .shadow(color: .gray, radius: 5, x: 1, y: 1)
                            .saturation(0.5)
                            .scaleEffect(scale)
                        Text("🐱")
                            .font(.system(size: 70))
                            .scaledToFill()
                            .frame(width: imageSize)
                    }
                }
                
                VStack(alignment: .leading) {
                    Text(breed.name)
                        .bold()
                    
                    HStack {
                        
                        ForEach(1..<6) { id in
                            Image(systemName: "circle.fill")
                                .foregroundColor(breed.energyLevel > id ? Color.accentColor : Color.gray)
                        }
                    }
                    
                }
                .padding()
                .frame(width: 180, alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .scaleEffect(scale)
                
            }
            .frame(width: 180, height: 250)
           // .shadow(color: .black, radius: 5, x: 1, y: 1)
            .cornerRadius(20)
            
            Button {
                print("Add to fav list")
                DataManager().addCat(breedExplaination: breed.breedExplaination, energyLevel: Int64(breed.energyLevel), id: breed.id, image: breed.image?.url ?? "", isHairless: breed.isHairless, name: breed.name, temperament: breed.temperament, context: managedObjectContext)
                
            } label: {
                Image(systemName: "heart.fill")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(Color("Color4"))
                    .cornerRadius(50)
                    .shadow(color: .gray, radius: 5, x: 1, y: 1)
                    .saturation(0.7)
            }
        }
        .shadow(color: Color("Color3"), radius: 10, x: 1, y: 1)
        .opacity(5)
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        BreedCard(breed: Breed.example1())
            .previewLayout(.fixed(width: 300, height: 200))
    }
}
