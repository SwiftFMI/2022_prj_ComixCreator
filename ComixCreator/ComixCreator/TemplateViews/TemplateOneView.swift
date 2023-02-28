//
//  TemplateOneView.swift
//  ComixCreator
//
//  Created by Svetoslav Dimov on 25.02.23.
//

import SwiftUI

struct TemplateOneView: View {
    @ObservedObject var comix: ComixModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(0...comix.images.count - 1, id: \.self) { index in
                        NavigationLink(destination: PictureGalleryView(imageIndex: index, comix: comix)) {
                            CustomView(image: comix.images[index])
                        }
                    }
                }
                .padding(Edge.Set.horizontal, 5)
            }
            HStack {
                NavigationLink(destination: TextBoxGalleryView()) {
                    Button("Add text") {}
                }
                .buttonStyle(RoundedRectangleButtonStyle())
                .padding(Edge.Set.horizontal, 30)
            }
        }
    }
}

struct TemplateOneView_Previews: PreviewProvider {
    static var previews: some View {
        TemplateOneView(comix: ComixModel(images: [], textClouds: [], template: .One))
    }
}

struct CustomView : View {

    var image: Image = Image("Empty")
    
    var body: some View {
        ZStack{
            image
                .resizable()
                .scaledToFit()
                .border(Color.blue)
                .clipped()
        }
    }
}
