//
//  GeometryEffectAnimationsView.swift
//  StanfordCS193p
//
//  Created by Samuel Owino on 27/12/2021.
//

import SwiftUI

struct GeometryEffectAnimationsView: View {
    var body: some View {
        TabView {
            MatchedGeometryEffectView()
                .badge(1)
                .tabItem {
                    Text("Effect 1")
                }
            AdvancedGemotryEffectView()
                .tabItem {
                    Text("Effect 2")
                }
                .badge(2)
        }
    }
}

struct GeometryEffectAnimationsView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryEffectAnimationsView()
    }
}
