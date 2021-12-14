//
//  LazyVStackView.swift
//  StanfordCS193p
//
//  Created by Samuel Owino on 14/12/2021.
//

import SwiftUI

struct RowItemView: View {
    let id: Int
    
    var body: some View {
        Text("Urgh! another Star Wars movie, episode \(id)")
    }
    
    init(id: Int){
       print("Loading stars wars movie list \(id)") //debug
        self.id = id
    }
}

struct LazyVStackView: View {
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(1...10000, id: \.self, content: RowItemView.init)
            }
        }
    }
}

struct LazyVStackView_Previews: PreviewProvider {
    static var previews: some View {
        LazyVStackView()
    }
}
