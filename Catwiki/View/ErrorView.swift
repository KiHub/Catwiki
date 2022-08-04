//
//  ErrorView.swift
//  Catwiki
//
//  Created by  Mr.Ki on 03.08.2022.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var breedFetcher: BreedFetcher
    var body: some View {
        VStack {
            Text("❌").font(.system(size: 70))
            
            Text(breedFetcher.errorMessage ?? "Something wrong with the internet connection")
                
            Button {
                breedFetcher.fetchAllBreeds()
            } label: {
                Text("Try again")
            }
            .buttonStyle(RoundedRectangleButtonStyle())
            .padding()
        }
    }
}

//struct RoundedRectangleButtonStyle: ButtonStyle {
//  func makeBody(configuration: Configuration) -> some View {
//    Button(action: {}, label: {
//      HStack {
//        Spacer()
//        configuration.label.foregroundColor(.black)
//        Spacer()
//      }
//    })
//    .padding()
//    .background(Color.yellow.cornerRadius(8))
//    .scaleEffect(configuration.isPressed ? 0.95 : 1)
//  }
//}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(breedFetcher: BreedFetcher())
    }
}
