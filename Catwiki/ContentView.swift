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
    

    
    var body: some View {
        
//        GeometryReader { proxy in
//            let topEdge = proxy.safeAreaInsets.top
            
            
        
        
        if breedFetcher.isLoading {
            
            LoadingView()
        } else if breedFetcher.errorMessage != nil {
            ErrorView(breedFetcher: breedFetcher)
        } else {
            GeometryReader { proxy in
                        let topEdge = proxy.safeAreaInsets.top
                
            TabView {
                BreedGreedView(topEdge: topEdge, breeds: breedFetcher.breeds, colums: colums)
                    .ignoresSafeArea(.all, edges: .top)
                    .tabItem {
                        Image(systemName: "book")
                        Text("Wiki")
                            
                    }
                BreedListViewCD()
                    .tabItem {
                        Image(systemName: "heart")
                        Text("Your list")
                    }
            }
        }
        }
    }
//}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


