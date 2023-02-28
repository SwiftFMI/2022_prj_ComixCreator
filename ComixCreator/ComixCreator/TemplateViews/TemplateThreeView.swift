//
//  TemplateThreeView.swift
//  ComixCreator
//
//  Created by Svetoslav Dimov on 25.02.23.
//

import SwiftUI

struct TemplateThreeView: View {
    @ObservedObject var comix: ComixModel
    
    var body: some View {
        HStack(spacing: 10) {
            NavigationLink(destination: PictureGalleryView(imageIndex: 0, comix: comix)) {
                CustomView(image: comix.images[0], width: 245, height: 490)
            }
            VStack {
                NavigationLink(destination: PictureGalleryView(imageIndex: 1, comix: comix)) {
                    CustomView(image: comix.images[1], width: 127, height: 364)
                }
                NavigationLink(destination: PictureGalleryView(imageIndex: 2, comix: comix)) {
                    CustomView(image: comix.images[2], width: 127, height: 119)
                }
            }
        }
        .padding(Edge.Set.horizontal, 10)
    }
}

struct TemplateThreeView_Previews: PreviewProvider {
    static var previews: some View {
        TemplateThreeView(comix: ComixModel(images: [], textClouds: [], template: .Three))
    }
}
