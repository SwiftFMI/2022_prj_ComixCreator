//
//  ComixModel.swift
//  ComixCreator
//
//  Created by Svetoslav Dimov on 25.02.23.
//

import Foundation
import SwiftUI

struct TextCloud: Codable {
    var text: String
    var x_leading: Float
    var y_leading: Float
}

class ComixModel: ObservableObject, Codable {
    @Published var images: [String] = []
    @Published var textClouds: [TextCloud] = []
    @Published var template: ComixTemplate
    @Published var overview: String = ""

    init(images: [String], textClouds: [TextCloud], template: ComixTemplate, overview: String) {
        self.images = images
        self.textClouds = textClouds
        self.template = template
        self.overview = overview
        
        switch template {
        case .One:
            for _ in 0...7 {
                self.images.append("plus_button")
            }
        case .Two:
            for _ in 0...2 {
                self.images.append("plus_button")
            }
            self.images.append("plus_button2")
        case .Three:
            self.images.append("plus_button3")
            self.images.append("plus_button4")
            self.images.append("plus_button5")
        case .Four:
            self.images.append("plus_button6")
            self.images.append("plus_button7")
            self.images.append("plus_button8")
            self.images.append("plus_button9")
            self.images.append("plus_button10")
            self.images.append("plus_button11")
        }
    }
    enum CodingKeys: String, CodingKey {
        case images
        case textClouds
        case template
        case overview
   }
    
    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        images = try values.decode([String].self, forKey: .images)
        textClouds = try values.decode([TextCloud].self, forKey: .textClouds)
        template = try values.decode(ComixTemplate.self, forKey: .template)
        overview = try values.decode(String.self, forKey: .overview)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(images, forKey: .images)
        try container.encode(textClouds, forKey: .textClouds)
        try container.encode(template, forKey: .template)
        try container.encode(overview, forKey: .overview)
    }
}
