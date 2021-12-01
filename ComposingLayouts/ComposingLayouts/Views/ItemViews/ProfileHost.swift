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
        
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            HStack {
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == EditMode.inactive {
                ProfileSummaryView(profile: modelData.profile)
            }else {
                Text("Profile Editor")
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
