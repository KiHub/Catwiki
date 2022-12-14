//
//  FloatingBar.swift
//  Catwiki
//
//  Created by  Mr.Ki on 28.08.2022.
//

import SwiftUI

struct FloatingTabBar: View {
    
    var colums = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    var tabs = ["home", "save"]
    @StateObject var breedFetcher = BreedFetcher()
    @State var selectedTab = "home"
  //  @State var shouldShowOnboarding: Bool = true
    
    // Location of each curve
    @State var xAxis: CGFloat = 0
    @Namespace var animation
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $selectedTab) {
                
                BreedGreedView(breeds: breedFetcher.breeds, colums: colums)
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("home")
                
                BreedListViewCD()
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("save")
                
               
                    
            }

            HStack(spacing: 0) {
                ForEach(tabs, id: \.self) { image in
                    GeometryReader { reader in
                        Button(action: {
                            withAnimation {
                                selectedTab = image
                                xAxis = reader.frame(in: .global).minX
                            }
                        }, label: {
                            Image(image)
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 22.0, height: 22.0)
                                .foregroundColor(selectedTab == image ? .white : Color("ColorTabLight"))
                                .padding(selectedTab == image ? 15 : 0)
                                .background(Color("ColorTab").opacity(selectedTab == image ? 1 : 0)
                                    .clipShape(Circle()))
                                .matchedGeometryEffect(id: image, in: animation)
                                .offset(x: selectedTab == image ? -10 : 0, y: selectedTab == image ? -50 : 0)
                        })
                        .onAppear(perform: {
                            if image == tabs.first {
                                xAxis = reader.frame(in: .global).minX
                            }
                        })
                    }
                    .frame(width: 25.0, height: 30.0)
                    if image != tabs.last { Spacer() }
                }
            }
            .padding(.horizontal, 60)
            .padding(.vertical)
            .background(Color("ColorTab").clipShape(CustomShape(xAxis: xAxis)).cornerRadius(20.0))
            
            .padding(.horizontal)
            // Bottom edge....
            .padding(.bottom, 35)
        }
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct FloatingTabBar_Previews: PreviewProvider {
    static var previews: some View {
        FloatingTabBar()
    }
}

