//
//  ModelData.swift
//  chapter-one
//
//  Created by Samuel Owino on 26/11/2021.
//

/**
 Create a load( ) method that fetches JSON data with a given name from the app's main bundle.
 
 The load method relies on the return type's conformance to the Decodable protocol, which is one component of the Codable protocol.
 
 The load method relies on the return type's conformance to the Decodable protocol, which is one component of the Codable protocol.
 
 */

import Foundation
import Combine

final class ModelData : ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
}

func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)
    else {
        fatalError("Couldn't find \(fileName) in main app bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(fileName) from main bundle:\n\(error)")
    }
    
    do {
        let decorder = JSONDecoder()
        return try decorder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(fileName) as \(T.self):\n\(error)")
    }
}
