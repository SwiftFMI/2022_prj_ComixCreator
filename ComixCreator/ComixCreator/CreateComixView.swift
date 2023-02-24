//
//  CreateComixView.swift
//  ComixCreator
//
//  Created by Svetoslav Dimov on 23.02.23.
//

import SwiftUI

struct CreateComixView: View {
    
    @State private var goesToPictureGallery: Bool = false
    @State private var goesToTextBoxGallery: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    CustomView(image: Image("Comix1"))
                    CustomView(image: Image("Comix1"))
                }
                HStack {
                    CustomView(image: Image("Comix1"))
                    CustomView(image: Image("Comix1"))
                    
                }
                HStack {
                    CustomView(image: Image("Comix1"))
                    CustomView(image: Image("Comix1"))
                }
                HStack {
                    CustomView(image: Image("Comix1"))
                    CustomView(image: Image("Comix1"))
                }
            }
            HStack {
                NavigationLink(destination: PictureGalleryView(), isActive: $goesToPictureGallery) {
                    Button(action: { goesToPictureGallery = true }) {
                        Text("Add photo")
                    }
                }
                .buttonStyle(RoundedRectangleButtonStyle())
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

struct CreateComixView_Previews: PreviewProvider {
    static var previews: some View {
        CreateComixView()
    }
}

struct CustomView : View {

    var image: Image = Image("Empty")
    
    var body: some View {
        ZStack{
            image
                .resizable()
                .scaledToFill()
                .frame(height: 100)
                .border(Color.black)
                .clipped()
                .padding(10)
        }
    }
}
