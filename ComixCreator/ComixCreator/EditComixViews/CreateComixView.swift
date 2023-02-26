//
//  CreateComixView.swift
//  ComixCreator
//
//  Created by Svetoslav Dimov on 23.02.23.
//

import SwiftUI

struct CreateComixView: View {
    @StateObject var comix: ComixModel
    
    var body: some View {
        NavigationStack {
            switch comix.template {
            case .One:
                TemplateOneView(comix: comix)
            case .Two:
                TemplateTwoView(comix: comix)
            case .Three:
                TemplateThreeView(comix: comix)
            case .Four:
                TemplateFourView(comix: comix)
            }
        }
    }
}

struct CreateComixView_Previews: PreviewProvider {
    static var previews: some View {
        CreateComixView(comix: ComixModel(images: [], textClouds: [], template: .One))
    }
}
