//
//  ExpandedListView.swift
//  StanfordCS193p
//
//  Created by Samuel Owino on 21/12/2021.
//

import SwiftUI

struct ExpandedListView: View {
    
    var body: some View {
        List(items, children: \.expenses){ row in
            HStack {
                Image(systemName: row.icon)
                Text(row.name)
                Spacer()
                Text("$ \(row.amount)")
                    .foregroundColor(.red)
            }
        }
    }
    
    let items: [ExpenseData] = [
        ExpenseData(
            icon: "rectangle.on.rectangle.circle", date: "Dec 12 2021", name: "Main Expenses", amount: 1000,
            expenses: [
            ExpenseData(icon: "bolt.horizontal", date: "Dec 12 2021", name: "Cups", amount: 200.00),
            ExpenseData(icon: "bolt.horizontal", date: "Dec 12 2021", name: "Tea", amount: 40.00),
            ExpenseData(icon: "bolt.horizontal", date: "Dec 12 2021", name: "Bread", amount: 400.00),
            ExpenseData(icon: "bolt.horizontal", date: "Dec 12 2021", name: "Meat", amount: 780.00),
            ExpenseData(icon: "bolt.horizontal", date: "Dec 12 2021", name: "Drinks", amount: 300.00)
        ]),
        
        ExpenseData(
            icon: "house.circle.fill", date: "Dec 13 2021",name: "Cutlery", amount: 200.00,
            expenses: [
            ExpenseData(icon: "bolt.horizontal", date: "Dec 12 2021",name: "Cups", amount: 200.00),
            ExpenseData(icon: "bolt.horizontal", date: "Dec 12 2021",name: "Tea", amount: 40.00),
            ExpenseData(icon: "bolt.horizontal", date: "Dec 12 2021",name: "Greens", amount: 400.00),
            ExpenseData(icon: "bolt.horizontal", date: "Dec 12 2021",name: "Meat", amount: 780.00),
            ExpenseData(icon: "bolt.horizontal", date: "Dec 12 2021",name: "Drinks", amount: 300.00),
        ]),
        
        ExpenseData(
            icon: "network", date: "Dec 14 2021",name: "Cups", amount: 200.00,
            expenses: [
            ExpenseData(icon: "bolt.horizontal", date: "Dec 12 2021",name: "Cups", amount: 200.00),
            ExpenseData(icon: "bolt.horizontal", date: "Dec 12 2021",name: "Tea", amount: 40.00),
            ExpenseData(icon: "bolt.horizontal", date: "Dec 12 2021",name: "Lemon", amount: 400.00),
            ExpenseData(icon: "bolt.horizontal", date: "Dec 12 2021",name: "Chocolate", amount: 780.00),
            ExpenseData(icon: "bolt.horizontal", date: "Dec 12 2021",name: "Wine", amount: 300.00)
        ])
    ]
}

struct ExpenseData: Identifiable {
    let id: UUID = UUID()
    var icon: String
    var date: String
    var name: String
    var amount: Double
    var expenses: [ExpenseData]?
}

struct ExpandedListView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandedListView()
    }
}
