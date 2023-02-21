//
//  ComixView.swift
//  ComixCreator
//
//  Created by Svetoslav Dimov on 21.02.23.
//

import SwiftUI

struct ComixView: View {
    var body: some View {
        VStack{
            Image("Comix1")
                .resizable()
                .scaledToFit()
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Comix1")
                            .font(.title.bold())
                    }
                }
            HStack{
                Button("Edit") {
                    
                }
                .buttonStyle(RoundedRectangleButtonStyle())
                .padding(Edge.Set.horizontal, 10)
                Button("Export image") {
            
                }
                .buttonStyle(RoundedRectangleButtonStyle())
                .padding(Edge.Set.trailing, 10)
            }
        }
    }
}

struct RoundedRectangleButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    Button(action: {}, label: {
      HStack {
        Spacer()
        configuration.label.foregroundColor(.black)
        Spacer()
      }
    })
    .padding()
    .allowsHitTesting(false)
    .background(Color("babyBlue")).cornerRadius(25)
    .scaleEffect(configuration.isPressed ? 0.95 : 1)
  }
}

struct ComixView_Previews: PreviewProvider {
    static var previews: some View {
        ComixView()
    }
}
