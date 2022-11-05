//
//  FruitsSubscriber.swift
//  CombineCustomPubSub
//
//  Created by Samuel Owino on 05/11/2022.
//

import Foundation
import Combine

class FruitsSubscription<S: Subscriber>: Subscription where S.Input == [Fruit] {
    
    var subscriber: S?
    
    func request(_ demand: Subscribers.Demand) {
        guard demand > 0 else {
            print("Fruit subscriber request demand value is less than 1... escaping ...")
            return
        }
        
        print("Fruit subscriber request...")
        
        let fruitsRepository = FruitsRepository()
        
        print("Finished init repository...")
        
        let fruits:[Fruit] = fruitsRepository.downloadFruits()
        
        print("collected fruits \(fruits)")
        
        self.subscriber?.receive(fruits)
        
        print("Finish sending fruites to subscriber")
        
        self.subscriber?.receive(completion: .finished)
        
        print("Finish calling completion")
        
        self.cancel()
        
        print("Fiinish cancellation...")
        
    }
    
    func receive(subscription: Subscription){
        subscription.request(.max(100))
    }
    
    func cancel() {
        print("Fruit subscriber cancelled...")
        subscriber = nil
    }
}


class FruitsSubcriber: Subscriber {
    
    typealias Input = [Fruit]
    typealias Failure = FruitDeliveryError
    
    func receive(subscription: Subscription) {
        subscription.request(.unlimited)
    }
    
    func receive(_ input: [Fruit]) -> Subscribers.Demand {
        print("Received some value here \(input)")
        return .none
    }
    
    func receive(completion: Subscribers.Completion<FruitDeliveryError>) {
        print("Received completion \(completion)")
    }
    
    
}

struct FruitsPublisher: Publisher {
    typealias Output = [Fruit]
    typealias Failure = FruitDeliveryError
    
    func receive<S>(subscriber: S) where S : Subscriber, FruitDeliveryError == S.Failure, [Fruit] == S.Input {
        let subscription = FruitsSubscription<S>()
        subscriber.receive(subscription: subscription)
    }
    
}
