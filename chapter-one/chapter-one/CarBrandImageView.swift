//
//  CarBrandImageView.swift
//  chapter-one
//
//  Created by Samuel Owino on 26/11/2021.
//

import SwiftUI

/**
 CREATING A CUSTOM IMAGE VIEW
 
 To add an image, start by adding the image file to the project's asset catalog.
 Replace the default tex with Image
 */

struct CarBrandImageView: View {
    var body: some View {
        Image("lambo")
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 3)
    }
}

struct CarBrandImageView_Previews: PreviewProvider {
    static var previews: some View {
        CarBrandImageView()
    }
}
