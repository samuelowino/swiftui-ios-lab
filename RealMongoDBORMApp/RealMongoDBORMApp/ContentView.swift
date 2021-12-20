//
//  ContentView.swift
//  RealMongoDBORMApp
//
//  Created by Samuel Owino on 17/12/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var addPerson: Bool = false
    var body: some View {
        VStack {
            if addPerson {
                PersonFormView()
            } else {
                VStack {
                    PersonsListView()
                    
                    Button {
                        addPerson.toggle()
                    } label: {
                        Label("Add Person", systemImage: "person.circle")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
