//
//  PersonFormView.swift
//  RealMongoDBORMApp
//
//  Created by Samuel Owino on 20/12/2021.
//

import SwiftUI

struct PersonFormView: View {
    
    @State var name: String = ""
    @State var age: String = ""
    @State var dob: String = ""
    @State var isSavingPerson: Bool = false
    @State var errorOccured: Bool = false
    @State var personSavedSuccesfully: Bool = false
    @StateObject var viewModel: PersonViewModel = PersonViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Add Person")
                
                Form {
                    Group {
                        Text("Person Name:")
                            .bold()
                        TextField("Add person name", text: $name)
                    }
                    
                    Group {
                        Text("Age:")
                            .bold()
                        
                        TextField("Enter Age", text: $age)
                    }
                   
                    Group {
                        Text("Date Of Birth:")
                            .bold()
                        
                        TextField("Enter Dob", text: $dob)
                    }
                    
                    if isSavingPerson {
                        ProgressView("Saving Person")
                    } else {
                        Button {
                            savePerson()
                            isSavingPerson = true
                        } label: {
                            Text("Save")
                        }
                    }
                    
                    if errorOccured {
                        Text("Person saving failed, error coccured")
                            .foregroundColor(.red)
                    } else if personSavedSuccesfully {
                        Text("Person Saved Succssfully")
                            .foregroundColor(.blue)
                        
                        NavigationLink("View People", destination: PersonsListView())
                    }
                }
            }
        }
    }
    
    func savePerson(){
        let person = Person()
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
            isSavingPerson = false
        }
    }
}

struct PersonFormView_Previews: PreviewProvider {
    static var previews: some View {
        PersonFormView()
    }
}
