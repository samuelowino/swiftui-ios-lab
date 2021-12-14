//
//  ColorPickerView.swift
//  StanfordCS193p
//
//  Created by Samuel Owino on 14/12/2021.
//

import SwiftUI

struct ColorPickerView: View {
    
    @State private var bgColor: Color = .white
    
    var body: some View {
        ColorPicker("Set the background color", selection: $bgColor)
            .frame(width: 300, height: 400)
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView()
    }
}
