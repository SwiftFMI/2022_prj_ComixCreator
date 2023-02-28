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
        
        switch template {
        case .One:
            for _ in 0...7 {
                self.images.append(Image("PlusButton"))
            }
        case .Two:
            for _ in 0...2 {
                self.images.append(Image("PlusButton"))
            }
            self.images.append(Image("PlusButton2"))
        case .Three:
                self.images.append(Image("PlusButton3"))
                self.images.append(Image("PlusButton4"))
                self.images.append(Image("PlusButton5"))
        case .Four:
                self.images.append(Image("PlusButton6"))
                self.images.append(Image("PlusButton7"))
                self.images.append(Image("PlusButton8"))
                self.images.append(Image("PlusButton9"))
                self.images.append(Image("PlusButton10"))
                self.images.append(Image("PlusButton11"))
        }
    }
}
