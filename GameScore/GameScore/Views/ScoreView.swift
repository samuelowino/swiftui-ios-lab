//
//  ScoreView.swift
//  GameScore
//
//  Created by Samuel Owino on 30/11/2021.
//

import SwiftUI

struct ScoreView: View {
    
    @EnvironmentObject var settings: GameSettings
    
    var body: some View {
        Text("The score is \(settings.score)")
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
