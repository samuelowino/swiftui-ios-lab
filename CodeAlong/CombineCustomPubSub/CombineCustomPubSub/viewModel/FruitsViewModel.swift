//
//  FruitsViewModel.swift
//  CombineCustomPubSub
//
//  Created by Samuel Owino on 05/11/2022.
//

import Foundation

class FruitsViewModel: ObservableObject {
        
    @Published var fruits: [Fruit] = []
    
    func loadSomeFruits()  {
        let publisher = FruitsPublisher()
        let subscriber = FruitsSubcriber()
        publisher.subscribe(subscriber)
        let cancellable = publisher.sink(receiveCompletion: { completion in
            print("completed with errors i think..\(completion)")
        }, receiveValue: { fruits in
            print("Received some fruits bruh!")
            self.fruits.append(contentsOf: fruits)
        })
    }
}
