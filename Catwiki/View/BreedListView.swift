//
//  BreedListView.swift
//  Catwiki
//
//  Created by  Mr.Ki on 03.08.2022.
//

import SwiftUI
import CoreData

struct BreedListView: View {
    
    @Environment(\.managedObjectContext) var context
    
//    @FetchRequest(entity: Item.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Item. , ascending: true)])
//    
    let breeds: [Breed]
    @State private var searchText: String = ""
//    var filtredBreds: [Breed] {
//        if searchText.count == 0 {
//            return breeds
//        } else {
//            return breeds.filter { $0.name.contains(searchText) }
//        }
//    }
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(breeds) { breed in
                    NavigationLink {
                        BreedDetailView(breed: breed)
                    } label: {
                        BreedRow(breed: breed)
                    }
                }
                
                .listRowSeparator(.hidden)
                
            }
            .navigationTitle("CatWiki")
        }
    }
}

//struct BreedListView_Previews: PreviewProvider {
//    static var previews: some View {
//        BreedListView(breeds: BreedFetcher.successState().breeds)
//    }
//}

