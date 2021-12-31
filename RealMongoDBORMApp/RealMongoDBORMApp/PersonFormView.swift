//
//  PersonFormView.swift
//  RealMongoDBORMApp
//
//  Created by Samuel Owino on 20/12/2021.
//

import SwiftUI

struct PersonFormView: View {
    
    var isUpdateFunction: Bool
    var personToUpdate: Person
    @State var name: String = ""
    @State var age: String = ""
    @State var dob: String = ""
    @State var isSavingPerson: Bool = false
    @State var errorOccured: Bool = false
    @State var personSavedSuccesfully: Bool = false
    @StateObject var viewModel: PersonViewModel = PersonViewModel()
    
    var body: some View {
        VStack {
            Text("Add Person")
            
            Form {
                Group {
                    Text("Person Name:")
                        .bold()
                    TextField(isUpdateFunction ? personToUpdate.name : "Add person name", text: $name)
                }
                
                Group {
                    Text("Age:")
                        .bold()
                    
                    TextField(isUpdateFunction ? personToUpdate.age : "Enter Age", text: $age)
                }
               
                Group {
                    Text("Date Of Birth:")
                        .bold()
                    
                    TextField(isUpdateFunction ? personToUpdate.dob : "Enter Dob", text: $dob)
                }
                
                if !personSavedSuccesfully {
                    if isSavingPerson {
                        ProgressView("Saving Person")
                    } else {
                        Button {
                            if isUpdateFunction {
                                updatePerson()
                            } else {
                                savePerson()
                            }
                            isSavingPerson = true
                        } label: {
                            Text(isUpdateFunction ? "Update" : "Save")
                        }
                    }
                }
                
                if errorOccured {
                    Text("Person saving failed, error coccured")
                        .foregroundColor(.red)
                } else if personSavedSuccesfully {
                    Text("Person Saved Successfully")
                        .foregroundColor(.blue)
                    
                    NavigationLink("View People", destination: PersonsListView())
                }
            }
        }
    }
    
    func savePerson(){
        let person = Person()
        person.uuid = UUID().uuidString
        person.name = name
        person.age = age
        person.dob = dob
        
        viewModel.addPerson(person) { error in
            if let error = error {
                print("Error occured while saving person \(error)")
                errorOccured = true
            } else {
                print("Person saved successfully!")
                personSavedSuccesfully = true
            }
            isSavingPerson.toggle()
        }
    }
    
    func updatePerson(){
        let personData = Person()
        personData.uuid = personToUpdate.uuid
        personData.name = name
        personData.age = age
        personData.dob = dob
        viewModel.updatePerson(personData) { error in
            if let error = error {
                print("Person update failed \(error)")
                errorOccured = true
            } else {
                print("Person updated successfully!")
                personSavedSuccesfully = true
            }
            isSavingPerson = false
        }
    }
}

struct PersonFormView_Previews: PreviewProvider {
    static var previews: some View {
        PersonFormView(isUpdateFunction: false, personToUpdate: Person())
    }
}
