//
//  ContentView.swift
//  iosconfcodealong
//
//  Created by Samuel Owino on 05/11/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .task {
            await Database.fetchRecords()
        }
    }
}

struct Database {
    static func fetchRecords() async {
        print("fetching records bruh!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
