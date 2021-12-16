//
//  API.swift
//  freshOSNetworking
//
//  Created by Samuel Owino on 16/12/2021.
//

import Foundation
import Networking
import Combine

struct API: NetworkingService {
    var network: NetworkingClient = NetworkSetup().network
    
    func fetchPost(findWithId id: Int) -> AnyPublisher<Post, Error> {
        get("/posts/\(id)")
    }
    
    func createPost(post: Post) -> AnyPublisher<Post, Error> {
        self.post("/posts", params: [
            "userId" : post.userId,
            "id": post.id,
            "title": post.title,
            "body": post.body]
        )
    }
    
    func update(post: Post) -> AnyPublisher<Post, Error> {
        put("/posts/\(post.id)", params: [
            "userId" : post.userId,
            "id": post.id,
            "title": post.title,
            "body": post.body
        ])
    }
    
    func delete(post: Post) -> AnyPublisher<Void, Error> {
        delete("/posts/\(post.id)")
    }
    
    func fetchAll() -> AnyPublisher<[Post], Error> {
        get("/posts")
    }
}
