import SwiftUI

class DallePictureGenerator {
    static let shared = DallePictureGenerator()
    let sessionID = UUID().uuidString
    
    private init() { }
    
    func isPromptValid(_ prompt: String, apiKey: String) async throws -> Bool {
        guard let url = URL(string: "https://api.openai.com/v1/moderations") else {
            throw ImageError.badURL
        }
        
        let parameters: [String: Any] = [
            "input" : prompt
        ]
        let data: Data = try JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        request.httpBody = data
        
        let (response, _) = try await URLSession.shared.data(for: request)
        let result = try JSONDecoder().decode(DallePolicyComplianceResponse.self, from: response)
        
        return result.hasIssues == false
    }
    
    func generateImage(withPrompt prompt: String, apiKey: String) async throws -> PicturesGenerationResponse {
        guard try await isPromptValid(prompt, apiKey: apiKey) else {
            throw ImageError.inValidPrompt
        }
        
        guard let url = URL(string: "https://api.openai.com/v1/images/generations") else {
            throw ImageError.badURL
        }
        
        let parameters: [String: Any] = [
            "prompt" : prompt,
            "n" : picturesGenerated,
            "size" : "1024x1024",
            "user" : sessionID
        ]
        let data: Data = try JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        request.httpBody = data
        
        let (response, _) = try await URLSession.shared.data(for: request)
        let result = try JSONDecoder().decode(PicturesGenerationResponse.self, from: response)
        return result
    }
}

enum ImageError: Error {
    case inValidPrompt, badURL
}
