//
//  ParkCircleImageView.swift
//  ComposingLayouts
//
//  Created by Samuel Owino on 30/11/2021.
//

import SwiftUI

struct ParkCircleImageView: View {
    var image: Image
    var body: some View {
        image
            .frame(width: 120, height: 120)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 3)
    }
}

struct ParkCircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        ParkCircleImageView(image: Image("twinlake"))
    }
}
