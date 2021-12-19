//
//  PersonRepository.swift
//  RealMongoDBORMApp
//
//  Created by Samuel Owino on 19/12/2021.
//

import Foundation
import RealmSwift

struct PersonRepository {
    
    private let databaseConfig: DatabaseConfig = DatabaseConfig()
    private var database: Realm?
    
    init(){
        database = databaseConfig.getDatabase()
    }
    
    func savePerson(_ person: Person) throws -> Bool {
        database?.beginWrite()
        database?.add(person)
        try database?.commitWrite()
    }
    
    func loadPerson(_ uuid: String) -> Person? {
        database?.object(ofType: Person.self, forPrimaryKey: )
    }
    
    func updatePerson(_ person: Person) -> Bool {
        
    }
}
