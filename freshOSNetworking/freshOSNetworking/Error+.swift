//
//  Error+.swift
//  NetworkingDemo
//
//  Created by Alex Nagy on 02.10.2021.
//

import Foundation
import Networking

extension Error {
    func printError() {
        switch self {
        case (let decodingError as DecodingError):
            print("JSON decoding error: \(decodingError.localizedDescription)")
        case (let networkingError as NetworkingError):
            print("Networking error: \(networkingError.localizedDescription)")
            print("Networking error status: \(networkingError.status)")
            print("Networking error code: \(networkingError.code)")
        default:
            print(self.localizedDescription)
        }
    }
}
