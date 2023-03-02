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
                    NavigationLink(destination: CreateComixView(comix: .init(images: [], textClouds: [], template: .One, overview: ""), isEdit: false)) {
                        Image("Template1")
                            .resizable()
                            .scaledToFit()
                    }
                    NavigationLink(destination: CreateComixView(comix: .init(images: [], textClouds: [], template: .Two, overview: ""), isEdit: false)) {
                        Image("Template2")
                            .resizable()
                            .scaledToFit()
                    }
                }
                .padding(10)
                HStack {
                    NavigationLink(destination: CreateComixView(comix: .init(images: [], textClouds: [], template: .Three, overview: ""), isEdit: false)) {
                        Image("Template3")
                            .resizable()
                            .scaledToFit()
                    }
                    NavigationLink(destination: CreateComixView(comix: .init(images: [], textClouds: [], template: .Four, overview: ""), isEdit: false)) {
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


