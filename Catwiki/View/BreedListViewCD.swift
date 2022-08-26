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
    
    
  //  @Environment(\.managedObjectContext) var context
    
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
     //   cat.endIndex.
        NavigationView {
            List {
                            ForEach(cat) { catBreed in
                              //  Text(catBreed.name ?? "Error")
                                
                                NavigationLink {
                                    BreedDetailViewCD(breed: catBreed)
                                } label: {
                                    BreedRowCD(breed: catBreed)
                                }
                                
//                                NavigationLink(destination: BreedDetailView(breed: catBreed as? Breed ?? <#default value#>)) {
//                                    HStack {
//                                        VStack(alignment: .leading, spacing: 6) {
//                                            Text(catBreed.name ?? "Error")
//                                                .bold()
//                                          //"  Text()
//                                          //  Text("\(Int())") + Text(" calories").foregroundColor(.orange)
//                                        }
//                                        Spacer()
//                                        Text(calcTimeSince(date: $cat.date))
//                                            .foregroundColor(.gray)
//                                            .italic()
//                                    }
//                                }
                            }
                
                            .onDelete(perform: deleteCat)
                            .listRowSeparator(.hidden)
                        }
//            List {
//                ForEach(cat) { breed in
//                    NavigationLink {
//                     //   BreedDetailView(breed: breed)
//                    } label: {
//                        BreedRowCD(breed: breed)
//                    }
//                }
//
//                .listRowSeparator(.hidden)
//
//            }
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

//struct BreedListView_Previews: PreviewProvider {
//    static var previews: some View {
//        BreedListView(breeds: BreedFetcher.successState().breeds)
//    }
//}

