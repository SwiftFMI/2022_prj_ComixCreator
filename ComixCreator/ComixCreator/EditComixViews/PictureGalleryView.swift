//
//  PictureGalleryView.swift
//  ComixCreator
//
//  Created by Svetoslav Dimov on 24.02.23.
//

import SwiftUI

struct PictureGalleryView: View {
    @State private var prompt: String = ""
    @State private var images: [UIImage] = []
    @State private var isLoading: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("Enter prompt", text: $prompt, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                Button {
                    isLoading = true
                    Task {
                        do {
                            let response = try await DallePictureGenerator.shared.generateImage(withPrompt: prompt, apiKey: ProtectedData.dalleApiKey)
                            
                            let urls = response.data.map(\.url)
                            if !urls.isEmpty {
                                for url in urls {
                                    let (data, _) = try await URLSession.shared.data(from: url)
                                    images.append(UIImage(data: data)!)
                                }
                            }
                            print("IMAGES COUNT: \(images.count)")
                            isLoading = false
                        } catch {
                            print(error)
                        }
                    }
                } label: {
                    Image(systemName: "paperplane.fill")
                }
                .buttonStyle(.borderedProminent)
            }
            
            
            if images.count == picturesGenerated {
                ScrollView(.vertical) {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(images, id: \.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }
            } else {
                if isLoading {
                    VStack {
                        LoadingView()
                            .scaledToFit()
                            .padding(90)
                    }
                }
            }
        }
        .padding(10)
    }
}

struct PictureGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        PictureGalleryView()
    }
}


//                Button("Save Image") {
//                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
//                }
