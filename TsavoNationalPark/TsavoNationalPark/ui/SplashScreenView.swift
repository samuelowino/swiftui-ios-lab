//
//  SplashScreenView.swift
//  TsavoNationalPark
//
//  Created by Samuel Owino on 25/05/2022.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Tsavo National Park")
                .primaryTitleStyle()
            Text("Official App")
                .primaryFontStyle()
            
            NavigationLink(destination: SignupForm()){
                Text("Continue")
                    .font(.title2)
                    .foregroundColor(.blue)
            }.padding()
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
