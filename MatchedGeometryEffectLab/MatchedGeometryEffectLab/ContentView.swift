//
//  ContentView.swift
//  MatchedGeometryEffectLab
//
//  Created by Samuel Owino on 02/03/2024.
//
import SwiftUI
struct ContentView: View {
    @Namespace var animationNameSpace
    @State var isExpanded: Bool = false
    var animationId = "animationID"
    @State var selected: Bool = false
    var body: some View {
        VStack {
            if isExpanded {
                VStack {
                    Circle()
                        .fill(.blue)
                        .frame(width: 200, height: 200)
                        .matchedGeometryEffect(id: animationId, in: animationNameSpace)
                    Text("Collapsed View")
                        .font(.title)
                }
            } else {
                VStack {
                    Circle()
                        .fill(.red)
                        .frame(width: 100, height: 100)
                        .matchedGeometryEffect(id: animationId, in: animationNameSpace)
                    Text("Collapsed View")
                        .font(.title)
                        .scaleEffect(selected ? 1.5 : 1.0)
                        .animation(.bouncy, value: selected)
                        .onTapGesture {
                            selected.toggle()
                        }
                }
            }
        }
//        .onTapGesture {
//            withAnimation(.spring) {
//                isExpanded.toggle()
//            }
//        }
        .padding()
    }
}

#Preview {
    ContentView()
}
