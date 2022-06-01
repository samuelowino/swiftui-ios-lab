//
//  DashboardView.swift
//  TsavoNationalPark
//
//  Created by Samuel Owino on 01/06/2022.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        VStack{
            Text("Dashboard")
                .bold()
                .underline()
                .font(.title)
            
            NavigationLink(destination: LessonOneText()) {
                Label("Lesson 1: Fonts", image: "bolt")
            }
            
            NavigationLink(destination: LessonTwoMutlilineText()) {
                Label("Lesson 2: Multline Text Alignment", image: "bolt")
            }
            
            NavigationLink(destination: LessonThreeLineSpacingView()){
                Label("Lesson 3: Line Spacing", image: "bolt")
            }
                                    
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
