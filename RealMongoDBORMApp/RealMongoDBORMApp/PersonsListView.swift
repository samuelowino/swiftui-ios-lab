//
//  PersonsListView.swift
//  RealMongoDBORMApp
//
//  Created by Samuel Owino on 20/12/2021.
//

import SwiftUI

struct PersonsListView: View {
    
    @StateObject var viewModel: PersonViewModel = PersonViewModel()
    
    var body: some View {
        VStack {
            Text("People's Directory")
                .bold()
        
            ScrollView {
                ForEach(viewModel.people) { person in
                    NavigationLink(destination: PersonFormView(isUpdateFunction: true, personToUpdate: person)) {
                        Label(person.name, systemImage: "person.crop.circle")
                    }
                }
            }
        }.onAppear {
            viewModel.loadPoeple { error in
                if let error = error {
                    print("Load items failed \(error)")
                } else {
                    print("Load items successful")
                    for person in viewModel.people {
                        print("person \(person.name)")
                    }
                }
            }
        }
    }
}

struct PersonsListView_Previews: PreviewProvider {
    static var previews: some View {
        PersonsListView()
    }
}
