//
//  ForEachImageView.swift
//  GridViewLab
//
//  Created by Samuel Owino on 23/12/2023.
//

import SwiftUI

struct ForEachImageView: View {
    @State var images: [AppImage] = [
        AppImage(Image(systemName: "safari"))
    ]
    var body: some View {
        VStack {
            
            Text("Image List")
            
            ForEach(images) { image in
                image.image
            }
        }
    }
}

struct AppImage: Identifiable {
    var image: Image
    var id: Int = Int.random(in: 0...10_000)
    
    init(_ image: Image){
        self.image = image
    }
}

#Preview {
    ForEachImageView()
}
