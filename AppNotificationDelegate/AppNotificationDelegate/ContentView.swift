//
//  ContentView.swift
//  AppNotificationDelegate
//
//  Created by Samuel Owino on 08/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            showNotification()
        }
    }
    
    private func showNotification(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert, .provisional]) { granted, error in
            if let error {
                print("Error while requsting notification authorization \(error.localizedDescription)")
                return
            }
            guard granted else { print("Permission denied"); return}
            
            let content = UNMutableNotificationContent()
            content.title = "Battery low"
            content.body = "Needs to recharge 20%"
            content.sound = UNNotificationSound.default
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request){ error in
                if let error {
                    print("Failed to add notification request \(error.localizedDescription)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
