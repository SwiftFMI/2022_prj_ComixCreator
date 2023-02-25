//
//  ComixModel.swift
//  ComixCreator
//
//  Created by Svetoslav Dimov on 25.02.23.
//

import Foundation
import SwiftUI

struct TextCloud {
    var text: String
    var x_leading: Float
    var y_leading: Float
}

class ComixModel: ObservableObject {
    @Published var images: [Image] = []
    @Published var textClouds: [TextCloud] = []
    @Published var template: ComixTemplate
    
    init(images: [Image], textClouds: [TextCloud], template: ComixTemplate) {
        self.images = images
        self.textClouds = textClouds
        self.template = template
    }
}
