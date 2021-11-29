//
//  LamborghiniDealershipRow.swift
//  chapter-one
//
//  Created by Samuel Owino on 26/11/2021.
//

import SwiftUI

struct LandmarkRow: View {
    
    var dealership: Landmark
    
    var body: some View {
        HStack {
            dealership.image
                .resizable()
                .frame(width: 50, height: 50)
            
            VStack {
                Text(dealership.name)
                Text(dealership.park)
                    .lineLimit(1)
            }
            
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
                LandmarkRow(dealership: lamborghiniDealers[1])
                .previewLayout(.fixed(width: 300, height: 70))
            
                    LandmarkRow(dealership: lamborghiniDealers[6])
                        .previewLayout(.fixed(width: 300, height: 70))
        }
    }
}
