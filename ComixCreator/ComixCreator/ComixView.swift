//
//  ComixView.swift
//  ComixCreator
//
//  Created by Svetoslav Dimov on 21.02.23.
//

import SwiftUI

struct ComixView: View {
    @ObservedObject var comix: ComixModel
    @Environment(\.dismiss) var dismiss
    
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

            HStack{
                NavigationLink(destination: CreateComixView(comix: comix, isEdit: true)) {
                    Button("Edit") {  }
                }
                .buttonStyle(RoundedRectangleButtonStyle())
                .padding(Edge.Set.horizontal, 10)
                Button("Save Image") {
                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                    dismiss()
                }
                .buttonStyle(RoundedRectangleButtonStyle())
                .padding(Edge.Set.trailing, 10)
            }
        }

    }
}

struct RoundedRectangleButtonStyle: ButtonStyle {
    
    var isDisabled: Bool = false

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
    .background(Color(isDisabled ? "disabledGrey" : "babyBlue")).cornerRadius(25)
    .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

struct ComixView_Previews: PreviewProvider {
    static var previews: some View {
        ComixView(comix: ComixModel(images: [], textClouds: [], template: .One, overview: ""))
    }
}
