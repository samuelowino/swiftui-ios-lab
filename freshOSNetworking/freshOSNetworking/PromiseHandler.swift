//
//  PromiseHandler.swift
//  NetworkingDemo
//
//  Created by Alex Nagy on 02.10.2021.
//

import Combine

struct PromiseHandler<T: Codable> {
    static func fulfill(_ promise: AnyPublisher<T, Error>, storedIn cancellables: inout Set<AnyCancellable>, completion: @escaping (Result<T, Error>) -> ()) {
        promise.sink { result in
            switch result {
            case .finished:
                break
            case .failure(let error):
                error.printError()
                completion(.failure(error))
            }
        } receiveValue: { value in
            completion(.success(value))
        }
        .store(in: &cancellables)
    }
    
    static func fulfillArray(_ promise: AnyPublisher<[T], Error>, storedIn cancellables: inout Set<AnyCancellable>, completion: @escaping (Result<[T], Error>) -> ()) {
        promise.sink { result in
            switch result {
            case .finished:
                break
            case .failure(let error):
                error.printError()
                completion(.failure(error))
            }
        } receiveValue: { value in
            completion(.success(value))
        }
        .store(in: &cancellables)
    }
    
    static func fulfillDelete(_ promise: AnyPublisher<Void, Error>, storedIn cancellables: inout Set<AnyCancellable>, completion: @escaping (Error?) -> ()) {
        promise.sink { result in
            switch result {
            case .finished:
                break
            case .failure(let error):
                error.printError()
                completion(error)
            }
        } receiveValue: { _ in
            completion(nil)
        }
        .store(in: &cancellables)
    }
}
