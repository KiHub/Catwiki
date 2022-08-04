//
//  BreedListView.swift
//  Catwiki
//
//  Created by  Mr.Ki on 03.08.2022.
//

import SwiftUI

struct BreedListView: View {
    let breeds: [Breed]
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
            }
            .navigationTitle("Catwiki")
        }
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView(breeds: BreedFetcher.successState().breeds)
    }
}
