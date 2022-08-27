//
//  TopBar.swift
//  Catwiki
//
//  Created by  Mr.Ki on 27.08.2022.
//

import SwiftUI

struct TopBar: View {
    let maxHeight = UIScreen.main.bounds.height / 4.8
    var topEdge: CGFloat
    
    var body: some View {
        VStack(spacing: 15 ) {
            
            GeometryReader { proxy in
                VStack(alignment: .leading, spacing: 15) {
                    
                }
                .edgesIgnoringSafeArea(.top)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .background(Color.orange)
                .cornerRadius(20)
            }
            .frame(height: maxHeight)
        }
    }
    
}
