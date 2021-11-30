//
//  ModelData.swift
//  chapter-two-b
//
//  Created by Samuel Owino on 30/11/2021.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
}

func load<T: Decodable>(_ fileName:String) -> T {
    let data: Data
    
    
}
