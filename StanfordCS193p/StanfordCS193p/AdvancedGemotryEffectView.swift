//
//  AdvancedGemotryEffectView.swift
//  StanfordCS193p
//
//  Created by Samuel Owino on 27/12/2021.
//

import SwiftUI

struct AdvancedGemotryEffectView: View {
    
    @Namespace private var animationNamespace
    @State private var isZoomed = false
    
    var frameSize: CGFloat {
        isZoomed ? 300 : 44
    }
    
    var paddingSize: CGFloat {
        isZoomed ? 20 : 0
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.blue)
                        .frame(width: frameSize, height: frameSize)
                        .padding(.top, paddingSize)
                    
                    if isZoomed == false {
                        Text("The Incredible True Story - Logic")
                            .font(.headline)
                            .matchedGeometryEffect(id: "title", in: animationNamespace)
                        
                        Spacer()
                    }
                }
                
                if isZoomed == true {
                    Text("The Incredible True Story - Logic")
                        .font(.headline)
                        .matchedGeometryEffect(id: "title", in: animationNamespace)
                        .padding(.bottom, 60)
                    
                    Spacer()
                }
                
            }.onTapGesture {
                self.isZoomed.toggle()
            }
        }
        .padding()
        .frame(height: isZoomed ? 400 : 60)
        .background(Color(white: 0.9))
    }
}

struct AdvancedGemotryEffectView_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedGemotryEffectView()
    }
}
