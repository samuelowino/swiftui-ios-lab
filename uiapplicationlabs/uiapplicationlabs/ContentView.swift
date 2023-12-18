//
//  ContentView.swift
//  uiapplicationlabs
//
//  Created by Samuel Owino on 18/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State var errorMessage: String? = nil
    var body: some View {
        VStack {
            
            Text("UIApplication: Open URLs")
                .font(.title)
            
            if errorMessage != nil {
                Text(errorMessage!)
                    .foregroundColor(.red)
            }
            
            Divider()
            
            HStack {
                Button {
                    sendEmail()
                } label: {
                    Label("Send Email", systemImage: "mail")
                        .font(.title2)
                }
                
                Spacer()
            }
            
            Divider()
            
            HStack {
                Button {
                    openWebsite()
                } label: {
                    Label("Open Website", systemImage: "safari")
                        .font(.title2)
                }
                Spacer()
            }
            
            Divider()
            
            Spacer()
            
        }
        .padding()
    }
    
    func openWebsite(){
        guard let websiteURL = URL(string: "https://thelifeplanner.co") else { return }
        
        let app = UIApplication.shared
        if app.canOpenURL(websiteURL) {
            app.open(websiteURL)
        } else {
            errorMessage = "Browser Application not installed"
        }
    }
    
    func sendEmail(){
        let recipientEmail = "recipient@gmail.com"
        let subject = "Christmas Holiday Calendar🎄"
        let body = """
                Hello hope this finds you well.
                
                Have a happy holiday fam
                
                Cheers!🥳
                """
        guard let emailURL = URL(string: "mailto://\(recipientEmail)?subject=\(subject)&body=\(body)") else { return }
        
        let app = UIApplication.shared
        if app.canOpenURL(emailURL) {
            app.open(emailURL)
        } else {
            errorMessage = "Email Application not installed"
        }
    }
}

#Preview {
    ContentView()
}
