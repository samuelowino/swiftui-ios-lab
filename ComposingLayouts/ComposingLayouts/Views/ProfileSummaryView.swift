//
//  ProfileSummaryView.swift
//  ComposingLayouts
//
//  Created by Samuel Owino on 01/12/2021.
//

import SwiftUI

struct ProfileSummaryView: View {
    
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Notifications: \(profile.preferesNotifications ? "On" : "Off")")
                Text("Seasonal photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(Font.headline)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            HikeBadge(name: "Achieng")
                            HikeBadge(name: "Sarah")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Fina")
                                .hueRotation(Angle(degrees: 45))
                                .grayscale(0.5)
                            HikeBadge(name: "Susan")
                                .hueRotation(Angle(degrees: 65))
                            HikeBadge(name: "Stella")
                            HikeBadge(name: "Emma")
                            HikeBadge(name: "Harriet")
                        }
                        .padding(.bottom)
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)
                    
                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}

struct ProfileSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummaryView(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
