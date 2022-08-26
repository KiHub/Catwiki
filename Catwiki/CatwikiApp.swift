//
//  CatwikiApp.swift
//  Catwiki
//
//  Created by  Mr.Ki on 03.08.2022.
//

import SwiftUI

@main
struct CatwikiApp: App {
    
    @StateObject private var dataManager = DataManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataManager.container.viewContext)
        }
    }
}
