//
//  BreedFlowView.swift
//  Catwiki
//
//  Created by  Mr.Ki on 05.08.2022.
//

import SwiftUI

struct BreedGreedView: View {
    
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
                if searchText.count == 0 {
                TopBar(breeds: breeds.shuffled())
                }
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
                .navigationBarTitle(Text("CatWiki"))
                .searchable(text: $searchText)
            }
            .background(LinearGradient(gradient: Gradient(colors: [.white, Color("ColorTabLight"), .white]), startPoint: .top, endPoint: .bottom), ignoresSafeAreaEdges: .all)
            .opacity(10) 
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct BreedGreedView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


