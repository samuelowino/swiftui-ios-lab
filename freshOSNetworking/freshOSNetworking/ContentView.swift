//
//  ContentView.swift
//  freshOSNetworking
//
//  Created by Samuel Owino on 16/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        ScrollView {
            Text(viewModel.post.title)
                .font(.title)
            Text(viewModel.post.body)
                .font(.body)
            Divider()
            Button {
                fetchPost()
            } label: {
                Text("Fetch")
            }
        }
        .navigationTitle("Networking")
    }
    
    func fetchPost() {
        viewModel.fetch(postWithId: 1) { err in
            if let err = err {
                print(err)
                return
            }
            print("Successfully fetched post: \(viewModel.post)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

