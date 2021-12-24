//
//  DatePickerView.swift
//  StanfordCS193p
//
//  Created by Samuel Owino on 24/12/2021.
//

import SwiftUI

struct DatePickerView: View {
    
    @State private var date = Date()
    
    var body: some View {
        VStack {
            Text("Task deadline:")
            Text("\(date)")
                .font(.caption)
            DatePicker("Task Date", selection: $date)
                .datePickerStyle(GraphicalDatePickerStyle())
        }
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
