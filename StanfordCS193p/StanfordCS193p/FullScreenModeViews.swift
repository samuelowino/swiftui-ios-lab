//
//  FullScreenModeViews.swift
//  StanfordCS193p
//
//  Created by Samuel Owino on 28/12/2021.
//

import SwiftUI

struct ChatDetailedView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var contact: WhatsAppContacts
    
    var body: some View {
        VStack(alignment:.leading) {
            HStack{
                Circle()
                    .fill(.blue)
                    .frame(width: 50, height: 50)
                VStack {
                    Text(contact.name)
                    Text("typing...")
                }
                Spacer()
            }
            
            Divider()
            
            ScrollView {
                ForEach(chats) { message in
                    VStack(alignment: .trailing){
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.green)
                            Text(message.message)
                                .lineLimit(1)
                                .font(.subheadline)
                                .padding(.horizontal)
                        }.frame(height: 30)
                            .padding(.horizontal)
                    }
                }
            }
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.blue)
                Text("< Exit Read Only Chats")
                    .font(.headline)
                    .foregroundColor(.white)
            }.frame(height: 50)
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
        }.padding()
    }
    
    @State private var chats: [WhatsAppMessage] = [
        WhatsAppMessage(sender: "Mildred", message: "Hey, did you get my last vn", read: false),
        WhatsAppMessage(sender: "Mildred", message: "Are you ghosting me ?", read: false),
        WhatsAppMessage(sender: "Mildred", message: "I just wanner talk...", read: false),
        WhatsAppMessage(sender: "Mildred", message: "You know what, @$%# you...", read: false),
    ]
}

struct FullScreenModeViews: View {
    
    @State private var showChatDetails: Bool = false
    @State private var selectedContact: WhatsAppContacts = WhatsAppContacts()
    
    var body: some View {
        ScrollView {
            ForEach(contacts) { contact in
                VStack(alignment: .leading){
                    HStack {
                        Circle()
                            .fill(contact.color)
                            .frame(width: 30, height: 30)
                        Text(contact.name)
                            .font(.headline)
                            .bold()
                        
                        Spacer()
                    }
                    Text("Last chat \(contact.lastChat)")
                        .lineLimit(1)
                        .font(.caption)
                }.onTapGesture {
                    selectedContact = contact
                    showChatDetails.toggle()
                }
            }
        }.padding()
            .fullScreenCover(isPresented: $showChatDetails) {
                ChatDetailedView(contact: $selectedContact)
            }
    }
    
    @State private var contacts: [WhatsAppContacts] = [
        WhatsAppContacts(name: "Mildred", color: Color.red, lastChat: Date()),
        WhatsAppContacts(name: "Johna", color: Color.blue, lastChat: Date()),
        WhatsAppContacts(name: "Ignore ^^",color: Color.orange, lastChat: Date())
    ]
}

struct WhatsAppContacts: Identifiable {
    var id: UUID = UUID()
    var name: String = ""
    var color: Color = Color.red
    var lastChat: Date = Date()
}

struct WhatsAppMessage: Identifiable {
    var id: UUID = UUID()
    var sender: String
    var message: String
    var read: Bool
}

struct FullScreenModeViews_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenModeViews()
    }
}
