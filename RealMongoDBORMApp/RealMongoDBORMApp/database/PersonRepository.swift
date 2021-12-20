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
    
    func savePerson(_ person: Person) throws {
        try! database?.write {
            database?.add(person)
        }
    }
    
    func loadAllPeople() throws -> Results<Person>? {
        database?.objects(Person.self)
    }
    
    func loadPerson(_ uuid: String) -> Person? {
        let people = database?.objects(Person.self)
        return people?.first
    }
    
    func updatePerson(_ person: Person) -> Bool {
        return false
    }
}
