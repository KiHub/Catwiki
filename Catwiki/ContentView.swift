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
    @AppStorage("showOnboarding") var showOnboarding: Bool = true
    
    var body: some View {
        
        if breedFetcher.isLoading {
            
            LoadingView()
        } else if breedFetcher.errorMessage != nil {
            ErrorView(breedFetcher: breedFetcher)
        } else {
            FloatingTabBar()
                .fullScreenCover(isPresented: $showOnboarding) {
                    Onboarding(showOnboarding: $showOnboarding)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


