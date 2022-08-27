//
//  DataManager.swift
//  Catwiki
//
//  Created by  Mr.Ki on 26.08.2022.
//

import Foundation
import CoreData

class DataManager: ObservableObject {
    let container = NSPersistentContainer(name: "Fav")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Load data error ❌ \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Saved ✅")
        } catch {
            print("Data not saved ❌")
        }
    }
    
    func addCat(breedExplaination: String, energyLevel: Int64, id: String, image: String, isHairless: Bool, name: String, temperament: String, context: NSManagedObjectContext) {
        
        let cat = Item(context: context)
        cat.breedExplaination = breedExplaination
        cat.energyLevel = energyLevel
        cat.id = id
        cat.image = image
        cat.isHairless = isHairless
        cat.name = name
        cat.temperament = temperament
        cat.date  = Date()
        
        save(context: context)
        
    }
    
    func editCat(cat: Item, breedExplaination: String, energyLevel: Int64, id: String, image: String, isHairless: Bool, name: String, temperament: String, context: NSManagedObjectContext) {
        cat.breedExplaination = breedExplaination
        cat.energyLevel = energyLevel
        cat.id = id
        cat.image = image
        cat.isHairless = isHairless
        cat.name = name
        cat.temperament = temperament
        cat.date  = Date()
        
        save(context: context)
    }
}
