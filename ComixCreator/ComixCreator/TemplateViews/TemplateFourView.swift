//
//  TemplateFourView.swift
//  ComixCreator
//
//  Created by Svetoslav Dimov on 25.02.23.
//

import SwiftUI

struct TemplateFourView: View {
    @ObservedObject var comix: ComixModel
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                VStack {
                    NavigationLink(destination: PictureGalleryView(imageIndex: 0, comix: comix)) {
                        CustomView(image: comix.images[0], width: 175, height: 55)
                    }
                    NavigationLink(destination: PictureGalleryView(imageIndex: 1, comix: comix)) {
                        CustomView(image: comix.images[0], width: 175, height: 75)
                    }
                }
                NavigationLink(destination: PictureGalleryView(imageIndex: 2, comix: comix)) {
                    CustomView(image: comix.images[0], width: 200, height: 139)
                }
            }
            .padding(Edge.Set.horizontal, 5)
            HStack {
                NavigationLink(destination: PictureGalleryView(imageIndex: 3, comix: comix)) {
                    CustomView(image: comix.images[0], width: 145, height: 195)
                }
                NavigationLink(destination: PictureGalleryView(imageIndex: 4, comix: comix)) {
                    CustomView(image: comix.images[0], width: 229, height: 195)
                }
            }
            .padding(Edge.Set.horizontal, 5)
            NavigationLink(destination: PictureGalleryView(imageIndex: 5, comix: comix)) {
                CustomView(image: comix.images[0], width: 380, height: 150)
            }
            .padding(Edge.Set.horizontal, 5)
        }
    }
}

struct TemplateFourView_Previews: PreviewProvider {
    static var previews: some View {
        TemplateFourView(comix: ComixModel(images: [], textClouds: [], template: .Four, overview: ""))
    }
}
