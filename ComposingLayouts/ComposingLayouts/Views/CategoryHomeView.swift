//
//  CategoryHomeView.swift
//  ComposingLayouts
//
//  Created by Samuel Owino on 30/11/2021.
//

import SwiftUI

struct CategoryHomeView: View {
    var body: some View {
        NavigationView {
            Label("Work Folder", systemImage: "folder")
        }
    }
}

struct CategoryHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHomeView()
    }
}
