//
//  BreedListView.swift
//  Catwiki
//
//  Created by  Mr.Ki on 03.08.2022.
//

import SwiftUI

struct BreedListView: View {
    let breeds: [Breed]
    @State private var searchText: String = ""
    var filtredBreds: [Breed] {
        if searchText.count == 0 {
            return breeds
        } else {
            return breeds.filter { $0.name.contains(searchText) }
        }
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purple, .orange]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            NavigationView {
                List {
                    ForEach(filtredBreds) { breed in
                        NavigationLink {
                            BreedDetailView(breed: breed)
                        } label: {
                            BreedRow(breed: breed)
                        }
                    }
                    
                    // .listRowBackground(Color.clear)
                    //  .foregroundColor(Color.white)
                    .listRowSeparator(.hidden)
                    
                }
                .navigationTitle("Catwiki")
                .searchable(text: $searchText)
            }
        }
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView(breeds: BreedFetcher.successState().breeds)
    }
}
