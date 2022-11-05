//
//  FruitsViewModel.swift
//  CombineCustomPubSub
//
//  Created by Samuel Owino on 05/11/2022.
//

import Foundation
import Combine
import SwiftUI

class FruitsViewModel: ObservableObject {
        
    @Published var fruits: [Fruit] = []
    @State var cancellable = Set<AnyCancellable>()
    
    func loadSomeFruits()  {
        let publisher = FruitsPublisher()
        publisher.sink(receiveCompletion: { completion in
            print("completed with errors i think..\(completion)")
        }, receiveValue: { fruits in
            print("Received some fruits bruh!")
            self.fruits.append(contentsOf: fruits)
        }).store(in: &cancellable)
    }
}
