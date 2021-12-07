//
//  SettingsView.swift
//  ComposingLayouts
//
//  Created by Samuel Owino on 06/12/2021.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("darkModeEnabled") private var isDarkTheme: Bool = false
    @AppStorage("fontSize") private var fontSize = 12.00
    
    var body: some View {
        Form {
            Toggle("Dark Mode", isOn: $isDarkTheme)
            Slider(value: $fontSize, in:12...21)
            Text("Font size \(fontSize, specifier: "%.0f") pts")
            Text("Developer, A Plus Creator Studios")
                .bold()
                .lineLimit(2)
                .padding()
                .foregroundColor(.yellow)
        }
        .foregroundColor(.purple)
        .padding(2)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
