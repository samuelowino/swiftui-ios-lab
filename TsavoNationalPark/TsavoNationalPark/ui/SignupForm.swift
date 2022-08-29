//
//  SignupForm.swift
//  TsavoNationalPark
//
//  Created by Samuel Owino on 29/08/2022.
//

import SwiftUI

struct SignupForm: View {
    
    @EnvironmentObject var viewModel: SignupViewModel
    
    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.title)
                .padding()
            
            Text("Already filled with values from EnvironmentObject SignupViewModel")
                .font(.caption)
                .padding()
            
            TextField("Username ", text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Spacer()
        }
        .padding()
    }
}

struct SignupForm_Previews: PreviewProvider {
    static var previews: some View {
        SignupForm()
    }
}
