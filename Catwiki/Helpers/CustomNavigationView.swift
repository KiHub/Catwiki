//
//  CustomNavView.swift
//  Catwiki
//
//  Created by  Mr.Ki on 26.08.2022.
//
//
//import SwiftUI
//
//struct CustomNavigationView<Content: View>: View {
// //   let destination : Destination
//    let isRoot : Bool
//    let isLast : Bool
//    let color : Color
//    let content: Content
//    @State var active = false
//    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
//    
////    init(destination: Destination, isRoot : Bool, isLast : Bool,color : Color, @ViewBuilder content: () -> Content) {
////        self.destination = destination
////        self.isRoot = isRoot
////        self.isLast = isLast
////        self.color = color
////        self.content = content()
////    }
//    
//    var body: some View {
//        NavigationView {
//            GeometryReader { geometry in
//                Color.white
//                VStack {
//                    ZStack(alignment: .top) {
//                        WaveShape()
//                            .fill(color.opacity(0.3))
//                        HStack {
//                            Image(systemName: "arrow.left")
//                                .frame(width: 30)
//                                .onTapGesture(count: 1, perform: {
//                                    self.mode.wrappedValue.dismiss()
//                                }).opacity(isRoot ? 0 : 1)
//                            Spacer()
//                            Image(systemName: "command")
//                                .frame(width: 30)
//                            Spacer()
//                            Image(systemName: "arrow.right")
//                                .frame(width: 30)
//                                .onTapGesture(count: 1, perform: {
//                                    self.active.toggle()
//                                })
//                                .opacity(isLast ? 0 : 1)
//                            NavigationLink(
//                                destination: destination.navigationBarHidden(true)
//                                    .navigationBarHidden(true),
//                                isActive: self.$active,
//                                label: {
//                                    //no label
//                                })
//                        }
//                        .padding([.leading,.trailing], 8)
//                        .padding(.top, geometry.safeAreaInsets.top + 8)
//                        .frame(width: geometry.size.width)
//                        .font(.system(size: 22))
//                        
//                    }
//                    .frame(width: geometry.size.width, height: 60 + geometry.safeAreaInsets.top)
//                    .edgesIgnoringSafeArea(.top)
//                    
//                    Spacer()
//                    self.content
//                        .padding()
//                        .background(color.opacity(0.3))
//                        .cornerRadius(20)
//                    Spacer()
//                }
//            }.navigationBarHidden(true)
//        }
//    }
//}
//
