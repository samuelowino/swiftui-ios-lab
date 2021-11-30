//
//  ColorDetailView.swift
//  ColorSelectorApp
//
//  Created by Samuel Owino on 30/11/2021.
//

import SwiftUI

struct ColorDetailView: View {
    
    var color: Color
    
    var body: some View {
        color
            .frame(width: 200, height: 200)
            .navigationTitle(color.description.capitalized)
    }
}

struct ColorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ColorDetailView(color: Color.red)
    }
}
