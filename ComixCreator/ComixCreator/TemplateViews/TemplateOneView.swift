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
                            CustomView(image: comix.images[index], width: 190, height: 115)
                        }
                    }
                }
                .padding(Edge.Set.horizontal, 5)
            }
        }
    }
}

struct TemplateOneView_Previews: PreviewProvider {
    static var previews: some View {
        TemplateOneView(comix: ComixModel(images: [], textClouds: [], template: .One, overview: ""))
    }
}

struct CustomView : View {

    var image: String = "Empty"
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        ZStack{
            Image(uiImage: DatabaseUtils.getSavedImage(named: image)!)
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .border(Color.blue)
                .clipped()
        }
    }
}
