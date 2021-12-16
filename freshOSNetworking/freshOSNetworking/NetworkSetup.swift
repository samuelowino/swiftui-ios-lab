//
//  NetworkSetup.swift
//  freshOSNetworking
//
//  Created by Samuel Owino on 16/12/2021.
//

import Foundation
import Networking

class NetworkSetup {
    
    lazy var network: NetworkingClient = {
        var network = NetworkingClient(baseURL: "https://jsonplaceholder.typicode.com")
        network.timeout = 5 //seconds: TimeInterval
        network.logLevels = .debug
        return network
    }()
}
