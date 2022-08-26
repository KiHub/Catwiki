//
//  BreedListViewCD.swift
//  Catwiki
//
//  Created by  Mr.Ki on 20.08.2022.
//

import SwiftUI
import CoreData

struct BreedListViewCD: View {
    
    @Environment(\.managedObjectContext) var  managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date)]) var cat: FetchedResults<Item>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(cat) { catBreed in
                    NavigationLink {
                        BreedDetailViewCD(breed: catBreed)
                    } label: {
                        BreedRowCD(breed: catBreed)
                    }
                }
                .onDelete(perform: deleteCat)
                .listRowSeparator(.hidden)
            }
            .navigationTitle("CatWiki")
        }
    }
    
    private func deleteCat(offsets: IndexSet) {
        withAnimation {
            offsets.map { cat[$0] }.forEach(managedObjectContext.delete)
            DataManager().save(context: managedObjectContext)
        }
    }
}

struct BreedListViewCD_Previews: PreviewProvider {
    static var previews: some View {
        BreedListViewCD()
    }
}

