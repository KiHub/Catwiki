//
//  ContentView.swift
//  Catwiki
//
//  Created by  Mr.Ki on 03.08.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var colums = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    @StateObject var breedFetcher = BreedFetcher()
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.name, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    var savedItems: [Item] = []
    
    var body: some View {
        
        if breedFetcher.isLoading {
            LoadingView()
        } else if breedFetcher.errorMessage != nil {
            ErrorView(breedFetcher: breedFetcher)
        } else {
         
            TabView {
                
                BreedGreedView(breeds: breedFetcher.breeds, colums: colums)
                    .tabItem {
                        Image(systemName: "book")
                        Text("Wiki")
                    }
                BreedListViewCD(breeds: breedFetcher.breeds)
                    .tabItem {
                        Image(systemName: "heart")
                        Text("Your list")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
    //    ContentView()
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}


