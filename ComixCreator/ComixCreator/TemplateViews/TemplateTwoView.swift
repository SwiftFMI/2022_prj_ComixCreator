//
//  TemplateTwoView.swift
//  ComixCreator
//
//  Created by Svetoslav Dimov on 25.02.23.
//

import SwiftUI

struct TemplateTwoView: View {
    @ObservedObject var comix: ComixModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                NavigationLink(destination: PictureGalleryView(imageIndex: 0, comix: comix)) {
                    CustomView(image: comix.images[0], width: 380, height: 220)
                }
                HStack {
                    NavigationLink(destination: PictureGalleryView(imageIndex: 1, comix: comix)) {
                        CustomView(image: comix.images[1], width: 185, height: 100)
                    }
                    NavigationLink(destination: PictureGalleryView(imageIndex: 2, comix: comix)) {
                        CustomView(image: comix.images[2], width: 185, height: 100)
                    }
                }
                NavigationLink(destination: PictureGalleryView(imageIndex: 3, comix: comix)) {
                    CustomView(image: comix.images[3], width: 380, height: 150)
                }
            }
            .padding(Edge.Set.horizontal, 10)
            HStack {
                NavigationLink(destination: TextBoxGalleryView()) {
                    Button("Add text") {}
                }
                .buttonStyle(RoundedRectangleButtonStyle())
                .padding(Edge.Set.horizontal, 30)
                .padding(Edge.Set.vertical, 20)
            }
        }
    }
}

struct TemplateTwoView_Previews: PreviewProvider {
    static var previews: some View {
        TemplateTwoView(comix: ComixModel(images: [], textClouds: [], template: .Two))
    }
}
