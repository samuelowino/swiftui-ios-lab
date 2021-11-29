//
//  LamborghiniDealershipRow.swift
//  chapter-one
//
//  Created by Samuel Owino on 26/11/2021.
//

import SwiftUI

struct LamborghiniDealershipRow: View {
    
    var dealership: LamboDealership
    
    var body: some View {
        HStack {
            dealership.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(dealership.name)
        }
    }
}

struct LamborghiniDealershipRow_Previews: PreviewProvider {
    static var previews: some View {
        LamborghiniDealershipRow(dealership: lamborghiniDealers[0])
    }
}
