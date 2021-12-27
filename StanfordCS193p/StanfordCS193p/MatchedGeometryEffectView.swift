//
//  MatchedGeometryEffect.swift
//  StanfordCS193p
//
//  Created by Samuel Owino on 27/12/2021.
//

import SwiftUI

struct MatchedGeometryEffectView: View {
    @Namespace private var animationNamespace
    @State var isFlipped: Bool = false
    
    var body: some View {
        VStack {
            if isFlipped {
                Circle()
                    .fill(.red)
                    .frame(width: 44, height: 44)
                    .matchedGeometryEffect(id: "circle", in: animationNamespace)
                Text("The Incredibe True Story - Logic")
                    .font(.headline)
                    .matchedGeometryEffect(id: "albumTitle", in: animationNamespace)
            } else {
                Text("The Incredibe True Story - Logic")
                    .font(.headline)
                    .matchedGeometryEffect(id: "albumTitle", in: animationNamespace)
                Circle()
                    .fill(.red)
                    .frame(width: 44, height: 44)
                    .matchedGeometryEffect(id: "circle", in: animationNamespace)
            }
        }.onTapGesture {
            withAnimation {
                isFlipped.toggle()
            }
        }
    }
}

struct MatchedGeometryEffect_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryEffectView()
    }
}
