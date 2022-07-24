//
//  MonthsSegmentedPicker.swift
//  Pickers
//
//  Created by Samuel Owino on 24/07/2022.
//

import SwiftUI

struct MonthsSegmentedPicker: View {
    
    @State var selectedMonth: String = Calendar.current.monthSymbols[0]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Calendar.current.monthSymbols, id: \.self){ month in
                        HStack(alignment: .center) {
                            Text(month)
                                .bold()
                                .padding(8)
                                .frame(minWidth: 90, maxWidth: 90)
                                .background(selectedMonth == month ? .white : .black.opacity(0) , in: RoundedRectangle(cornerRadius: 6))
                                .padding(.vertical,2)
                                .font(.caption)
                                .onTapGesture {
                                    withAnimation {
                                        selectedMonth = month
                                    }
                                }
                        }
                    }
                }
                .background(.black.opacity(0.1), in: RoundedRectangle(cornerRadius: 8))
            }
            
            Spacer()
            
            SegmentedTelescopePicker()
        }
    }
}

struct MonthsSegmentedPicker_Previews: PreviewProvider {
    static var previews: some View {
        MonthsSegmentedPicker()
    }
}
