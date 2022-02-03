//
//  ContentView.swift
//  AppleDeviceNotifications
//
//  Created by Samuel Owino on 03/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: SettingsViewModel = SettingsViewModel()
    
    @State var showAlertFailed: Bool = false
    
    var body: some View {
        VStack {
            
            Text("User Notifications Lab")
                .bold()
                .font(.title)
            
            HStack {
                Text("Permission Status: \(viewModel.permissinStatusDescription)")
                    .bold()
                    .foregroundColor(.purple)
                    .padding()
                
                Spacer()
            }
            
            
            Button {
                //show notification
            } label: {
                Label("Show Provisional Notification", systemImage: "bell")
            }
            
            Spacer()
        }
        .alert("Notification Permission Request failed with error ", isPresented: $showAlertFailed) {
            Button("Ok") {
                showAlertFailed = true
            }
        }
        .onAppear {
            AppNotificationUtils.requestProvisionalNotificationPermissions { error, granted in
                if let error = error {
                    print("Permission request failed error: \(error)")
                } else {
                    viewModel.checkPermissionStatus()
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
