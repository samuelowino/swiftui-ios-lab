//
//  ProgressIndicatorView.swift
//  StanfordCS193p
//
//  Created by Samuel Owino on 15/12/2021.
//

import SwiftUI

struct ProgressIndicatorView: View {
    @State var docsCoverage: Float = 0.0
    @State var isDeveloper: Bool = false
    private var totalDocsRequired: Float = 10.0
    var body: some View {
        VStack {
            ProgressView(isDeveloper ? "You are now Developer!! Woot woot!": "Running Developer Growth...") //indeterminate progress bar
            ProgressView(isDeveloper ? "" : "Becoming a developer...", value: docsCoverage, total: totalDocsRequired) //determinate progress bar
            Button {
                if docsCoverage < totalDocsRequired { //clamp the value to ensure its always below or equal to 100
                    docsCoverage += 1
                } else {
                    isDeveloper = true
                }
            } label: {
                Text(isDeveloper ? "Do not read more docs, just write code now" : "Read more docs")
                    .foregroundColor(isDeveloper ? .red : .blue)
            }
        }
    }
}

struct ProgressIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressIndicatorView()
    }
}
