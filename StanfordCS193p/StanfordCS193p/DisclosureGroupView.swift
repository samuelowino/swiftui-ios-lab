//
//  DisclosureGroupView.swift
//  StanfordCS193p
//
//  Created by Samuel Owino on 24/12/2021.
//

import SwiftUI

struct DisclosureGroupView: View {
    
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack {
            DisclosureGroup("Grocery List", isExpanded: $isExpanded) {
                Text("Flour")
                Text("Milk")
                Text("Eggs")
                Text("Tea Leaves")
                Text("Bread")
                
                Button {
                    isExpanded.toggle()
                } label: {
                    Text("Collapse")
                }
            }
            
            Spacer()
        }.padding()
    }
}

struct DisclosureGroupView_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureGroupView()
    }
}
