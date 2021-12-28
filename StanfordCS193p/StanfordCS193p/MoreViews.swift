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
            FullScreenModeViews()
                .tag("Full Screen Mode View")
        }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct MoreViews_Previews: PreviewProvider {
    static var previews: some View {
        MoreViews()
    }
}
