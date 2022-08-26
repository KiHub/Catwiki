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
 //   let coreDataManager: CoreDataManager
    let imageSize: CGFloat = 300
    let scale: CGFloat = 0.9
    @State var savedBreeds: [Item] = []
    @Environment(\.managedObjectContext) var context
    
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
                                //.frame(width: imageSize, height: imageSize)
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
        
//        .toolbar {
//            ToolbarItemGroup(placement: .navigationBarTrailing) {
//                Button {
//                    breed.map { breed[$0] }.forEach(managedObjectContext.delete)
//                    DataManager().save(context: managedObjectContext)
////                    DataManager().addCat(breedExplaination: breed.breedExplaination, energyLevel: Int64(breed.energyLevel), id: breed.id, image: breed.image?.url ?? "", isHairless: breed.isHairless, name: breed.name, temperament: breed.temperament, context: managedObjectContext)
//                    dismiss()
//                    //     print("Save")
//                 //   coreDataManager.saveData(context: context)
//
////                    func saveData(context: NSManagedObjectContext) {
////
////                       // let breed: Breed
////                        let entity = Item(context: context)
////                        entity.name = breed.name
////                        entity.id = breed.id
////                        entity.image = breed.image?.url
////                        entity.breedExplaination = breed.breedExplaination
////                        entity.energyLevel = Int64(breed.energyLevel)
////                        entity.temperament = breed.temperament
////                        entity.isHairless = breed.isHairless
////
////                        savedBreeds.append(entity)
////
////
////                        do {
//////                            try context.save()
//////                            print("Success")
//////
//////                            if context.hasChanges {
//////                                print(entity.name)
//////                            }
////
////
////                        } catch {
////                            print(error.localizedDescription)
////                        }
////
////                    }
////                    saveData(context: context)
//
//                } label: {
//                    Image(systemName: "heart")
//                }
//            }
//        }
    }
}

//
//struct BreedDetailViewCD_Previews: PreviewProvider {
//    static var previews: some View {
//        BreedDetailViewCD(breed: Breed.example1())
//    }
//}

