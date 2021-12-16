//
//  ContentViewModel.swift
//  NetworkingDemo
//
//  Created by Alex Nagy on 02.10.2021.
//

import SwiftUI
import Combine
import Networking

class ContentViewModel: ObservableObject {
    
    private let api: API = API()
    
    @Published var post: Post = Post()
    @Published var posts: [Post] = []
    
    var cancellables: Set<AnyCancellable> = []
    
    func fetch(postWithId id: Int, completionHandler: @escaping (Error?) -> ()) {
        let promise = api.fetchPost(findWithId: id)
        PromiseHandler<Post>.fulfill(promise,
                                     storedIn: &cancellables) {
            result  in
            
            switch result {
                case .success(let post):
                    self.post = post
                    completionHandler(nil)
                    break
                case .failure( let error):
                    completionHandler(error)
            }
        }
    }
    
    func creatPost(post: Post, completionHandler: @escaping (Error?) ->()) {
        let promise = api.createPost(post: post)
        
        PromiseHandler<Post>.fulfill(promise,
                                     storedIn: &cancellables) { result in
            switch result {
            case .success(let post):
                self.post = post
                completionHandler(nil)
                break
            case .failure(let error):
                completionHandler(error)
            }
        }
    }
    
    func updatePost(post: Post, completionHandler: @escaping (Error?) ->()) {
        let promise = api.update(post: post)
        
        PromiseHandler<Post>.fulfill(promise,
                                     storedIn: &cancellables) { result in
            switch result {
            case .success(let post):
                self.post = post
                completionHandler(nil)
                break
            case .failure(let error):
                completionHandler(error)
            }
        }
    }
    
    func fetchAllPosts(completionHandler: @escaping (Error?) -> ()) {
        let promise = api.fetchAll()
        
        PromiseHandler<Post>.fulfillArray(promise,
                                            storedIn: &cancellables) { result in
            switch result {
            case .success(let posts):
                self.posts = posts
                completionHandler(nil)
                break
            case .failure(let error):
                completionHandler(error)
            }
        }
    }
    
    func deletePost(post: Post, completionHandler: @escaping (Error?) -> ()) {
        let promise = api.delete(post: post)
        PromiseHandler<Post>.fulfillDelete(promise, storedIn: &cancellables) { error in
            if let error = error {
                completionHandler(error)
                return
            }
            self.post = Post()
            completionHandler(nil)
        }
    }
    
}

