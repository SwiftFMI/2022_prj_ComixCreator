//
//  TemplateOneView.swift
//  ComixCreator
//
//  Created by Svetoslav Dimov on 25.02.23.
//

import SwiftUI

struct TemplateOneView: View {
    @State var goesToTextBoxGallery: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    NavigationLink(destination: PictureGalleryView()) {
                        CustomView(image: Image("PlusButton"))
                    }
                    NavigationLink(destination: PictureGalleryView()) {
                        CustomView(image: Image("PlusButton"))
                    }
                }
                HStack {
                    NavigationLink(destination: PictureGalleryView()) {
                        CustomView(image: Image("PlusButton"))
                    }
                    NavigationLink(destination: PictureGalleryView()) {
                        CustomView(image: Image("PlusButton"))
                    }
                }
                HStack {
                    NavigationLink(destination: PictureGalleryView()) {
                        CustomView(image: Image("PlusButton"))
                    }
                    NavigationLink(destination: PictureGalleryView()) {
                        CustomView(image: Image("PlusButton"))
                    }
                }
                HStack {
                    NavigationLink(destination: PictureGalleryView()) {
                        CustomView(image: Image("PlusButton"))
                    }
                    NavigationLink(destination: PictureGalleryView()) {
                        CustomView(image: Image("PlusButton"))
                    }
                }
            }
            HStack {
                NavigationLink(destination: TextBoxGalleryView(), isActive: $goesToTextBoxGallery) {
                    Button(action: { goesToTextBoxGallery = true }) {
                        Text("Add text")
                    }
                }
                .buttonStyle(RoundedRectangleButtonStyle())
            }
        }
    }
}

struct TemplateOneView_Previews: PreviewProvider {
    static var previews: some View {
        TemplateOneView()
    }
}
