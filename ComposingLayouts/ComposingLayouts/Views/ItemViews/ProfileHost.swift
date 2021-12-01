//
//  ProfileHost.swift
//  ComposingLayouts
//
//  Created by Samuel Owino on 01/12/2021.
//

import SwiftUI

struct ProfileHost: View {
    
    @Environment(\.editMode) var editMode
    @Environment(\.parkBrand) var parkBrand
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile: Profile = Profile.default
        
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                
                EditButton()
            }
            
            if editMode?.wrappedValue == EditMode.inactive {
                ProfileSummaryView(profile: modelData.profile)
            }else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
