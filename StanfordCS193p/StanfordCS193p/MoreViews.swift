//
//  MoreViews.swift
//  StanfordCS193p
//
//  Created by Samuel Owino on 28/12/2021.
//

import SwiftUI

struct MoreViews: View {
    var body: some View {
        TabView {
            ScrollToPositionView()
                .tag("Scroll Reader")
        }
    }
}

struct MoreViews_Previews: PreviewProvider {
    static var previews: some View {
        MoreViews()
    }
}
