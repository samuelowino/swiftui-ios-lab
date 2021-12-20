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
            
            NavigationLink(destination: PersonFormView(isUpdateFunction: false, personToUpdate: Person())) {
                Label("Add Someone here", systemImage: "person.badge.plus")
            }
        
            ScrollView {
                ForEach(viewModel.people) { person in
                    HStack {
                        NavigationLink(destination: PersonFormView(isUpdateFunction: true, personToUpdate: person)) {
                            Label(person.name, systemImage: "person.crop.circle")
                        }
                        
                        Image(systemName: "minus.circle.fill")
                            .onTapGesture {
                                deletePerson(person.uuid)
                            }
                            .foregroundColor(.red)
                    }
                }
            }
        }.onAppear {
            viewModel.loadPeople { error in
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
    
    func deletePerson(_ uuid: String){
        viewModel.deletePerson(withUuid: uuid){ error in
            if let error = error {
                print("Delete failed, error \(error)")
            } else {
                viewModel.loadPeople { loadError in
                    if let loadError = loadError {
                        print("People reload failed \(loadError)")
                    } else {
                        print("People reload completed with success")
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
