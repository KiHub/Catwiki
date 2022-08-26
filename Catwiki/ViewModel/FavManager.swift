//
//  FavManager.swift
//  Catwiki
//
//  Created by  Mr.Ki on 05.08.2022.
//

import Foundation
//
//class FavManager: ObservableObject {
//
//    @Published var items: [Item] = []
////    {
////        willSet {
////        objectWillChange.send()
////        }
////    }
//
//
//    init() {
//        let context = PersistenceController.shared.container.viewContext
//        let request = Item.fetchRequest()
//        do {
//           items = try context.fetch(request)
//        } catch {
//            print(error)
//        }
//    }
//
//    func add() {
//        let item = Item(context: PersistenceController.shared.container.viewContext)
//        items.append(item)
//    }
////    func update() {
////        if let first = items.first {
////        }
////    }
//}

//
//
//class FavManager: ObservableObject {
//    @Published private(set) var favBreeds: [Breed] = []
//    @Published private(set) var total: Int = 0
//    
//    func addToFav(breed: Breed) {
//        favBreeds.append(breed)
//        total += 1
//    }
//    func removeFromfav(breed: Breed) {
//        favBreeds = favBreeds.filter { $0.id != breed.id }
//        total -= 1
//    }
//}
