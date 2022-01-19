//
//  TimeLineView.swift
//  DrawingAndAnimations
//
//  Created by Samuel Owino on 19/01/2022.
//

import SwiftUI

struct TimeLineView: View {
    var body: some View {
        TimelineView(.periodic(from: Date(), by: 1)) { timeline in
            Text("Date : \(timeline.date)")
        }
    }
}

struct TimeLineView_Previews: PreviewProvider {
    static var previews: some View {
        TimeLineView()
    }
}
