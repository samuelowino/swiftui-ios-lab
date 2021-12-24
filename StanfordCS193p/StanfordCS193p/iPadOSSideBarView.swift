//
//  iPadOSSideBarView.swift
//  StanfordCS193p
//
//  Created by Samuel Owino on 24/12/2021.
//

import SwiftUI

struct iPadOSSideBarView: View {
    
    @State private var selectedContent: Int = 1
    
    var body: some View {
        NavigationView {
            SideBarView(selectedContent: $selectedContent)
            MainContentView(selectedContent: $selectedContent)
        }
    }
}

struct SideBarView: View {
    
    @Binding var selectedContent: Int
    
    var body: some View {
        List(1..<100) { i in
            Text("Menu Item \(i)")
                .onTapGesture {
                    selectedContent = i
                }
        }
        .listStyle(SidebarListStyle())
    }
}

struct MainContentView: View {
    
    @Binding var selectedContent: Int

    var body: some View {
        ZStack {
            if selectedContent == 1 {
                RoundedRectangle(cornerRadius: 2)
                    .fill(.black)
            } else if selectedContent > 1 && selectedContent < 5 {
                RoundedRectangle(cornerRadius: 2)
                    .fill(.green)
            } else if selectedContent > 5 && selectedContent < 8 {
                RoundedRectangle(cornerRadius: 2)
                    .fill(.orange)
            } else if selectedContent > 9 && selectedContent < 15 {
                RoundedRectangle(cornerRadius: 2)
                    .fill(.pink)
            }else if selectedContent > 15 && selectedContent < 20 {
                RoundedRectangle(cornerRadius: 2)
                    .fill(.yellow)
            } else {
                RoundedRectangle(cornerRadius: 2)
                    .fill(.purple)
            }
            
            Text("Main Content View, now showing \(selectedContent)")
                .foregroundColor(.white)
        }
    }
}

struct SecondaryView: View {
    var body: some View {
        Text("Secondary Content View")
    }
}

struct iPadOSSideBarView_Previews: PreviewProvider {
    static var previews: some View {
        iPadOSSideBarView()
    }
}
