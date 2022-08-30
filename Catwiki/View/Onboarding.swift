//
//  Onboarding.swift
//  Catwiki
//
//  Created by  Mr.Ki on 30.08.2022.
//

import SwiftUI

struct Onboarding: View {
    @Binding var showOnboarding: Bool

    var body: some View {
        TabView {
            PageView(title: "Are you a fan of cats?", imageName: "questionmark.app", showDismisButton: false, showOnboarding: $showOnboarding)

            PageView(title: "It is the right place where you can explore different breeds and find your favorite", imageName: "book", showDismisButton: false, showOnboarding: $showOnboarding)

            PageView(title: "Found the perfect cat breed? You can save it in your favorite cat list", imageName: "bookmark.square", showDismisButton: true, showOnboarding: $showOnboarding)

        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct PageView: View {
    let title: String
    let imageName: String
    let showDismisButton: Bool
    @Binding var showOnboarding: Bool

    var body: some View {
        VStack {
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .padding()
                .foregroundColor(Color.white)
                .shadow(color: Color("ColorTab"), radius: 18, x: 0, y: 0)


            Text(title)
                .foregroundColor(Color("ColorTab"))
                .font(.system(size: 28))
                .fontWeight(.thin)
                .padding()
                .shadow(color: Color("ColorLightShadow"), radius: 28, x: 5, y: 5)
                .padding(.horizontal)
            Spacer()
            if showDismisButton {
                Button {
                    showOnboarding.toggle()
                } label: {
                    Text("Get started")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 12)
                        .background {
                            Capsule()
                                .fill(Color("ColorTab").opacity(0.8))
                        }
                }
                .padding(.bottom, 80)
            }
        }
    }
}
