//
//  DatabaseConfig.swift
//  RealMongoDBORMApp
//
//  Created by Samuel Owino on 17/12/2021.
//

import Foundation
import RealmSwift

class DatabaseConfig {
    
    var database: Realm
    
    func getDatabase() -> Realm {
        if database.isEmpty {
            database = try! Realm()
        }
        
        return database
    }
    
    init(){
        database = try! Realm()
    }

}
