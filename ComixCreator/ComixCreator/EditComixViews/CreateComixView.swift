//
//  CreateComixView.swift
//  ComixCreator
//
//  Created by Svetoslav Dimov on 23.02.23.
//

import SwiftUI

struct CreateComixView: View {
    @ObservedObject var comix: ComixModel
    
    @Environment(\.dismiss) var dismiss
    
    var isEdit: Bool
    
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
            HStack {
                NavigationLink(destination: TextBoxGalleryView()) {
                    Button("Add text") {}
                }
                .buttonStyle(RoundedRectangleButtonStyle())
                .padding(Edge.Set.horizontal, 30)
                .padding(Edge.Set.vertical, 20)
                
                Button("Save") {
                    if !isEdit {
                        comix.overview = NSUUID().uuidString
                    }
                    _ = DatabaseUtils.saveImage(image: snapshot(), name: comix.overview)
                    DatabaseUtils.write(comix)
                    dismiss()
                }
                .buttonStyle(RoundedRectangleButtonStyle())
                .padding(Edge.Set.horizontal, 30)
                .padding(Edge.Set.vertical, 20)
            }
            Button("Set second picture") {
                let comixTest: [ComixModel] = DatabaseUtils.load("comixes")
                print(comixTest)
            }
            .buttonStyle(RoundedRectangleButtonStyle())
            .padding(Edge.Set.horizontal, 30)
            .padding(Edge.Set.vertical, 20)
        }
    }
}

struct CreateComixView_Previews: PreviewProvider {
    static var previews: some View {
        CreateComixView(comix: ComixModel(images: [], textClouds: [], template: .One, overview: ""), isEdit: false)
    }
}

extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = CGSize(width: 400, height: 700)
        view?.bounds = CGRect(x: 0, y: -240, width: 400, height: 800)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}
