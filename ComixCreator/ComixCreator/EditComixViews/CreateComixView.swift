//
//  CreateComixView.swift
//  ComixCreator
//
//  Created by Svetoslav Dimov on 23.02.23.
//

import SwiftUI

struct CreateComixView: View {
    @ObservedObject var comix: ComixModel
    
    var body: some View {
        NavigationStack {
            switch comix.template {
            case .One:
                TemplateOneView()
            case .Two:
                TemplateTwoView()
            case .Three:
                TemplateThreeView()
            case .Four:
                TemplateFourView()
            }
        }
    }
}

struct CreateComixView_Previews: PreviewProvider {
    static var previews: some View {
        CreateComixView(comix: ComixModel(images: [], textClouds: [], template: .One))
    }
}
