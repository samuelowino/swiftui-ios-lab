//
//  LessonTwoMutlilineText.swift
//  TsavoNationalPark
//
//  Created by Samuel Owino on 01/06/2022.
//

import SwiftUI

struct LessonTwoMutlilineText: View {
    var body: some View {
        Text("William Shakespeare was an English playwright, poet and actor. He is widely regarded as the greatest writer in the English language and the world's greatest dramatist. He is often called England's national poet and the \"Bard of Avon\"")
            .multilineTextAlignment(.center)
    }
}

struct LessonTwoMutlilineText_Previews: PreviewProvider {
    static var previews: some View {
        LessonTwoMutlilineText()
    }
}
