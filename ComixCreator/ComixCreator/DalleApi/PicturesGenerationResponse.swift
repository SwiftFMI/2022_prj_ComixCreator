// Created by Florian Schweizer on 09.11.22
import Foundation

struct PicturesGenerationResponse: Codable {
    struct PicturesResponse: Codable {
        let url: URL
    }
    
    let created: Int
    let data: [PicturesResponse]
}
