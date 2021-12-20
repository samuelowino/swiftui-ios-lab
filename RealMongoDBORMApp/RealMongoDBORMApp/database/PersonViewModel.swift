//
//  PersonViewModel.swift
//  RealMongoDBORMApp
//
//  Created by Samuel Owino on 19/12/2021.
//

import Foundation

class PersonViewModel: ObservableObject {
    @Published var person: Person = Person()
    @Published var people: [Person] = []
    private let repository: PersonRepository = PersonRepository()
    
    func loadPoeple(completionHandler: @escaping (Error?) -> ()) {
        do {
            people.removeAll()
            let peopleResult = try repository.loadAllPeople()
            for result in peopleResult! {
                people.append(result)
            }
            completionHandler(nil)
        } catch {
            completionHandler(error)
        }
    }
    
    func addPerson(_ person: Person, completionHandler: @escaping (Error?) ->()) {
        do {
            try repository.savePerson(person)
            completionHandler(nil)
        } catch {
            completionHandler(error)
        }
    }
    
    func updatePerson(_ data: Person,
                      completionHandler: @escaping (Error?) ->()){
        do {
            let updated: Bool = try repository.updatePerson(forUuid: data.uuid, forName: data.name, howOld: data.age, birthdate: data.dob)
            print("Person updated \(updated)")
            completionHandler(nil)
        } catch {
            completionHandler(error)
        }
    }

}
