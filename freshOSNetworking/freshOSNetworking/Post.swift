//
//  Post.swift
//  NetworkingDemo
//
//  Created by Alex Nagy on 02.10.2021.
//

import Networking

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    init(userId: Int? = nil,
         id: Int? = nil,
         title: String? = nil,
         body: String? = nil) {
        self.userId = userId ?? 0
        self.id = id ?? 0
        self.title = title ?? ""
        self.body = body ?? ""
    }
    
}

extension Post: NetworkingJSONDecodable {}

