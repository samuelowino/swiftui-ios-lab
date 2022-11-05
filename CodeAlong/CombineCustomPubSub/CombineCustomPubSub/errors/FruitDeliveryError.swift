//
//  FruitDeliveryError.swift
//  CombineCustomPubSub
//
//  Created by Samuel Owino on 05/11/2022.
//

import Foundation

enum FruitDeliveryError: String, Error {
    case justFailed = "Failed to delivery fruits for no reason at all 🤷🏾‍♂️"
    case internalError = "An internal error occured while delivering fruits 😵"
}
