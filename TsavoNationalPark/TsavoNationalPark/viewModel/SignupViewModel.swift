//
//  SignupViewModel.swift
//  TsavoNationalPark
//
//  Created by Samuel Owino on 29/08/2022.
//

import Foundation

class SignupViewModel: ObservableObject {
    @Published var username: String = "hackerman"
    @Published var password: String = "password123"
}
