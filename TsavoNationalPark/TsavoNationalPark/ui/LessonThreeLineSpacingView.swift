//
//  LessonThreeLineSpacingView.swift
//  TsavoNationalPark
//
//  Created by Samuel Owino on 01/06/2022.
//

import SwiftUI

struct LessonThreeLineSpacingView: View {
    var body: some View {
        ScrollView {
            VStack {
                
                Text("""
                
                >>10 LINE SPACING
                
                FROM off a hill whose concave womb reworded
                A plaintful story from a sistering vale,
                My spirits to attend this double voice accorded,
                And down I laid to list the sad-tuned tale;
                Ere long espied a fickle maid full pale,
                Tearing of papers, breaking rings a-twain,
                Storming her world with sorrow's wind and rain.
                
                """)
                    .lineSpacing(10)
                
                Text("""
                
                >>20 LINE SPACING
                
                FROM off a hill whose concave womb reworded
                A plaintful story from a sistering vale,
                My spirits to attend this double voice accorded,
                And down I laid to list the sad-tuned tale;
                Ere long espied a fickle maid full pale,
                Tearing of papers, breaking rings a-twain,
                Storming her world with sorrow's wind and rain.
                
                """)
                    .lineSpacing(20)
                
                Spacer()
            }
        }
    }
}

struct LessonThreeLineSpacingView_Previews: PreviewProvider {
    static var previews: some View {
        LessonThreeLineSpacingView()
    }
}
