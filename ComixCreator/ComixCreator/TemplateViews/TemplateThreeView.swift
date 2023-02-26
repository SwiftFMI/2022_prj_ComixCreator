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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TemplateThreeView_Previews: PreviewProvider {
    static var previews: some View {
        TemplateThreeView(comix: ComixModel(images: [], textClouds: [], template: .Three))
    }
}
