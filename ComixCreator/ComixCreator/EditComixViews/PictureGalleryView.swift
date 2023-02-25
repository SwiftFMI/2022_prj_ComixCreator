//
//  PictureGalleryView.swift
//  ComixCreator
//
//  Created by Svetoslav Dimov on 24.02.23.
//

import SwiftUI

struct PictureGalleryView: View {
    @State private var prompt: String = ""
    @State private var image: UIImage? = nil
    @State private var isLoading: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Enter prompt", text: $prompt, axis: .vertical)
                .textFieldStyle(.roundedBorder)
            
            Button("Generate") {
                isLoading = true
                Task {
                    do {
                        let response = try await DallePictureGenerator.shared.generateImage(withPrompt: prompt, apiKey: ProtectedData.dalleApiKey)
                        
                        if let url = response.data.map(\.url).first {
                            let (data, _) = try await URLSession.shared.data(from: url)
                            
                            image = UIImage(data: data)
                            isLoading = false
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            
            if let image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 256, height: 256)
                
                Button("Save Image") {
                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                }
            } else {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 256, height: 256)
                    .overlay {
                        if isLoading {
                            VStack {
                                ProgressView()
                                
                                Text("Loading...")
                            }
                        }
                    }
            }
        }
        .padding()
    }
}

struct PictureGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        PictureGalleryView()
    }
}
