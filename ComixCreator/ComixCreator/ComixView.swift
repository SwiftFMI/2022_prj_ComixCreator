//
//  ComixView.swift
//  ComixCreator
//
//  Created by Svetoslav Dimov on 21.02.23.
//

import SwiftUI

struct ComixView: View {
    @ObservedObject var comix: ComixModel
    
    var body: some View {
        var image: UIImage = {
            return DatabaseUtils.getSavedImage(named: comix.overview)!
        }()
        
        VStack{
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .navigationBarTitleDisplayMode(.inline)
                .onAppear(perform: {
                    image = DatabaseUtils.getSavedImage(named: comix.overview)!
                })
//                .toolbar {
//                    ToolbarItem(placement: .principal) {
//                        Text("Comix1")
//                            .font(.title.bold())
//                    }
//                }
            HStack{
                NavigationLink(destination: CreateComixView(comix: comix, isEdit: true)) {
                    Button("Edit") {  }
                }
                .buttonStyle(RoundedRectangleButtonStyle())
                .padding(Edge.Set.horizontal, 10)
                Button("Export image") {
            
                }
                .buttonStyle(RoundedRectangleButtonStyle())
                .padding(Edge.Set.trailing, 10)
            }
        }

    }
}

struct RoundedRectangleButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    Button(action: {}, label: {
      HStack {
        Spacer()
        configuration.label.foregroundColor(.black)
        Spacer()
      }
    })
    .padding()
    .allowsHitTesting(false)
    .background(Color("babyBlue")).cornerRadius(25)
    .scaleEffect(configuration.isPressed ? 0.95 : 1)
  }
}

struct ComixView_Previews: PreviewProvider {
    static var previews: some View {
        ComixView(comix: ComixModel(images: [], textClouds: [], template: .One, overview: ""))
    }
}
