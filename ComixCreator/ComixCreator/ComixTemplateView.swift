//
//  ComixTemplateView.swift
//  ComixCreator
//
//  Created by Svetoslav Dimov on 25.02.23.
//

import SwiftUI

struct ComixTemplateView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    NavigationLink(destination: CreateComixView(comix: .init(images: [], textClouds: [], template: .One))) {
                        Image("Template1")
                            .resizable()
                            .scaledToFit()
                    }
                    NavigationLink(destination: CreateComixView(comix: .init(images: [], textClouds: [], template: .Two))) {
                        Image("Template2")
                            .resizable()
                            .scaledToFit()
                    }
                }
                .padding(10)
                HStack {
                    NavigationLink(destination: CreateComixView(comix: .init(images: [], textClouds: [], template: .Three))) {
                        Image("Template3")
                            .resizable()
                            .scaledToFit()
                    }
                    NavigationLink(destination: CreateComixView(comix: .init(images: [], textClouds: [], template: .Four))) {
                        Image("Template4")
                            .resizable()
                            .scaledToFit()
                    }
                }
                .padding(10)
            }
        }
    }
}

struct ComixTemplateView_Previews: PreviewProvider {
    static var previews: some View {
        ComixTemplateView()
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
                .border(Color.blue)
                .clipped()
                .padding(10)
        }
    }
}
