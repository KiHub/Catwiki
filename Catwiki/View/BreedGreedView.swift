//
//  BreedFlowView.swift
//  Catwiki
//
//  Created by  Mr.Ki on 05.08.2022.
//

import SwiftUI

struct BreedGreedView: View {
    
  //  let maxHeight = UIScreen.main.bounds.height / 4.8
    
    var topEdge: CGFloat
//    var appearance: UINavigationBarAppearance {
//        let appearance = UINavigationBarAppearance()
//        appearance.shadowColor = .clear
//
//        appearance.backgroundColor = .orange
//        return appearance
//    }
//    func set() {
//    UINavigationBar.appearance().scrollEdgeAppearance = appearance
//            UINavigationBar.appearance().standardAppearance = appearance
//    }
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
//
//    init() {
//            //Use this if NavigationBarTitle is with Large Font
//            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.red]
//
//            //Use this if NavigationBarTitle is with displayMode = .inline
//            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
//
//
//        }
    
    var body: some View {
       
         
  
        NavigationView {
            ScrollView {
                
        //        TopBar(topEdge: topEdge)
                    
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
         //   }
            .navigationBarTitle(Text("CatWiki"))
                .searchable(text: $searchText)
        }
            .background(LinearGradient(gradient: Gradient(colors: [.white, Color("Color2"), .white]), startPoint: .top, endPoint: .bottom), ignoresSafeAreaEdges: .top)
            .opacity(10)
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct BreedGreedView_Previews: PreviewProvider {
    static var previews: some View {
      //  BreedGreedView(breeds: BreedFetcher.successState().breeds)
        ContentView()
    }
}


