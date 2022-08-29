//
//  BreedDetailViewCD.swift
//  Catwiki
//
//  Created by  Mr.Ki on 26.08.2022.
//

import SwiftUI
import CoreData

struct BreedDetailViewCD: View {
    
    @Environment (\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    let breed: FetchedResults<Item>.Element
    let imageSize: CGFloat = 300
    let scale: CGFloat = 0.9
    
    var body: some View {
        
        ScrollView {
            VStack {
                if let url = breed.image {
                    AsyncImage(url: URL(string: url)) { phase in
                        if let image = phase.image {
                            image.resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                .clipped()
                                .shadow(color: .gray, radius: 10, x: 5, y: 5)
                                .saturation(0.5)
                                .scaleEffect(scale)
                            
                        } else if phase.error != nil {
                            ZStack {
                                Color.red
                                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                    .shadow(color: .gray, radius: 10, x: 5, y: 5)
                                    .saturation(0.5)
                                    .scaleEffect(scale)
                                Text("❌")
                                    .font(.system(size: 70))
                                    .scaledToFill()
                                    .frame(width: imageSize, height: imageSize)
                            }
                        } else {
                            ProgressView()
                            
                        }
                    }
                } else {
                    ZStack {
                        Color.gray
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
                
                VStack(alignment: .leading, spacing: 20) {
                    Text(breed.name ?? "error")
                        .font(.headline)
                    Text(breed.temperament ?? "error")
                        .font(.footnote)
                    Text(breed.breedExplaination ?? "error")
                    if breed.isHairless {
                        Text("Hairless")
                    }
                    HStack {
                        Text("Activity level")
                        Spacer()
                        ForEach(1..<6) { id in
                            Image(systemName: "star.fill")
                                .foregroundColor(breed.energyLevel > id ? Color.accentColor : Color.gray)
                        }
                    }
                    
                }.padding()
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [.white, Color("ColorTabLight"), .white]), startPoint: .top, endPoint: .bottom), ignoresSafeAreaEdges: .all)
    }
}


