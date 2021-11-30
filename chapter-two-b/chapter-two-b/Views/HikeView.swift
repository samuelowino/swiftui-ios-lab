//
//  HikeView.swift
//  chapter-two-b
//
//  Created by Samuel Owino on 30/11/2021.
//

import SwiftUI

struct HikeView: View {
    
    var hike:Hike
    
    @State var showDetail:Bool = false
    
    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)
                
                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    
                    Text(hike.distanceText)
                }
                
                Spacer()
                
                Button {
                    withAnimation {
                        showDetail.toggle()
                    }
                } label: {
                    Label("Graph Label", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                        
                }
            }
            
            if showDetail {
                HikeDetail(hike: hike)
                    .transition(AnyTransition.move(edge: .trailing))
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        HikeView(hike: ModelData().hikes[0])
    }
}

