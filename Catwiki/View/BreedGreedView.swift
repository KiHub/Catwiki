//
//  BreedFlowView.swift
//  Catwiki
//
//  Created by  Mr.Ki on 05.08.2022.
//

import SwiftUI

struct BreedGreedView: View {
  //  @Environment (\.managedObjectContext) var managedObjectContext
    
    let breeds: [Breed]
    @State private var searchText: String = ""
    
    var filtredBreds: [Breed] {
        if searchText.count == 0 {
            return breeds
        } else {
            return breeds.filter { $0.name.contains(searchText) }
        }
    }
    var colums = [GridItem(.adaptive(minimum: 160), spacing: 15)]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: colums, spacing: 20) {
                    ForEach(filtredBreds) { breed in
                        
                        
                        NavigationLink {
                            BreedDetailView(breed: breed)
                        } label: {
                            BreedCard(breed: breed)
                            
                        }
                        
                    }
                }
                .padding()
            }
            .navigationTitle(Text("CatWiki"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .searchable(text: $searchText)
    }
}

struct BreedGreedView_Previews: PreviewProvider {
    static var previews: some View {
        BreedGreedView(breeds: BreedFetcher.successState().breeds)
    }
}
