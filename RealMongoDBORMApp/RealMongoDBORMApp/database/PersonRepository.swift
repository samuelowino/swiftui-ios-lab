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
    
    func updatePerson(forUuid uuid: String, forName name: String, howOld age: String, birthdate dob: String) throws -> Bool {
        try database?.write {
            let people = database?.objects(Person.self)
            for person in people! {
                if person.uuid == uuid {
                    person.name = name
                    person.age = age
                    person.dob = dob
                    break
                }
            }
        }
        return true
    }
    
    func deletePerson(WithUuid uuid: String) throws {
        try database?.write {
            let people = database?.objects(Person.self)
            for person in people! {
                if person.uuid == uuid {
                    database?.delete(person)
                    break
                }
            }
        }
    }
}
