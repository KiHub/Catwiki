//
//  TopBar.swift
//  Catwiki
//
//  Created by  Mr.Ki on 27.08.2022.
//

import SwiftUI

struct TopBar: View {
    let maxHeight = UIScreen.main.bounds.height / 6
    
    let breeds: [Breed]
    @State private var searchText: String = ""
    
    var body: some View {
            GeometryReader { proxy in
                VStack(alignment: .leading, spacing: 15) {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                               HStack(spacing: 10) {
                                   
                                   ForEach(breeds) { breed in
                                       NavigationLink {
                                           BreedDetailView(breed: breed)
                                       } label: {
                                           BreedCardCircle(breed: breed)
                                       }
                                   }
                               }
                           }
                }
                .edgesIgnoringSafeArea(.top)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .background(Color("ColorTabLight")).opacity(20)
                .cornerRadius(30)
                .padding(.horizontal)
            }
            .frame(height: maxHeight)
    }
}
