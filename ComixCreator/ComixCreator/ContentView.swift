//
//  ContentView.swift
//  ComixCreator
//
//  Created by Svetoslav Dimov on 14.02.23.
//

import SwiftUI

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct ContentView: View {
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Button("Create Comix") {
                        print("Create Comix pressed")
                    }
                    .buttonStyle(RoundedRectangleButtonStyle())
                    .padding(Edge.Set.horizontal, 100)
                    .padding(Edge.Set.vertical, 50)
                    Divider()
                        .padding(Edge.Set.bottom, 10)
                    Text("Your collection")
                        .font(.system(size: 18, weight: .medium, design: .serif))
                    LazyVGrid(columns: columns, spacing: 15) {
                        NavigationLink(destination: ComixView()) {
                            Image("Comix1")
                                .resizable()
                                .scaledToFit()
                        }
                        NavigationLink(destination: ComixView()) {
                            Image("Comix1")
                                .resizable()
                                .scaledToFit()
                        }
                        NavigationLink(destination: ComixView()) {
                            Image("Comix1")
                                .resizable()
                                .scaledToFit()
                        }
                        NavigationLink(destination: ComixView()) {
                            Image("Comix1")
                                .resizable()
                                .scaledToFit()
                        }
                        NavigationLink(destination: ComixView()) {
                            Image("Comix1")
                                .resizable()
                                .scaledToFit()
                        }
                        NavigationLink(destination: ComixView()) {
                            Image("Comix1")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Comix Creator App")
                        .font(.system(size: 28, weight: .bold, design: .serif))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
