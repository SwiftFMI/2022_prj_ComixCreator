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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TemplateTwoView_Previews: PreviewProvider {
    static var previews: some View {
        TemplateTwoView(comix: ComixModel(images: [], textClouds: [], template: .Two))
    }
}
