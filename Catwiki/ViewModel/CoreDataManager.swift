//
//  CoreData.swift
//  Catwiki
//
//  Created by  Mr.Ki on 20.08.2022.
//

import Foundation
import CoreData

class CoreDataManager: ObservableObject {
  //  static let shared = CoreDataManager(breed: <#Breed#>)
    let breed: Breed
    @Published var items: [Item] = []
    
//    func saveData(context: NSManagedObjectContext) {
//        
//       // let breed: Breed
//        let entity = Item(context: context)
//        entity.name = breed.name
//        entity.id = breed.id
//        entity.image = breed.image?.url
//        entity.breedExplaination = breed.breedExplaination
//        entity.energyLevel = Int64(breed.energyLevel)
//        entity.temperament = breed.temperament
//        entity.isHairless = breed.isHairless
//        
//        do {
//            try context.save()
//            print("Success")
//        } catch {
//            print(error.localizedDescription)
//        }
//        
//    }
    
    init(breed: Breed) {
        self.breed = breed
    }
}
