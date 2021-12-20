//
//  Person.swift
//  RealMongoDBORMApp
//
//  Created by Samuel Owino on 19/12/2021.
//

import Foundation
import RealmSwift

class Person: Object, Identifiable {
    @objc dynamic var uuid: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var age: String = ""
    @objc dynamic var dob: String = ""
    
    override class func primaryKey() -> String? {
            return "uuid"
    }
}
