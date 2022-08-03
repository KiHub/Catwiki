//
//  BreedFetcher.swift
//  Catwiki
//
//  Created by  Mr.Ki on 03.08.2022.
//

import Foundation

class BreedFetcher: ObservableObject {
    
    @Published var breeds = [Breed]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    init() {
        fetchAllBreeds()
    }
    
    func fetchAllBreeds() {
        
        isLoading = true

        let service = NetworkService()
        let url = URL(string: "https://api.thecatapi.com/v1/breeds")
        
//        service.fetchBreeds(url: url) { result in
//            switch result {
//            case .failure(let error):
//                self.errorMessage = error.localizedDescription
//                print(error.description)
//                print(error)
//            case .success(let breeds):
//                self.breeds = breeds
//            }
//        }
        
        service.fetch([Breed].self, url: url) { result in
            switch result {
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                print(error.description)
                print(error)
            case .success(let breeds):
                self.breeds = breeds
            }
        }
        
    }
    
    
}
