import Foundation

struct PicturesGenerationResponse: Codable {
    struct PicturesResponse: Codable {
        let url: URL
    }
    
    let created: Int
    let data: [PicturesResponse]
}
