//
//  ContentView.swift
//  iExpense
//
//  Created by Aaryan Kothari on 24/02/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import SwiftUI

struct ExpenseItem {
    let name: String
    let item : String
    let amount : Int
}

class Expenses : ObservableObject {
    @Published var items = [ExpenseItem]()
}

struct ContentView: View {
    
    @ObservedObject var expenses = Expenses()
    var body: some View {
        NavigationView{
            List{
                ForEach(expenses.items, id: \.name){ item in
                    Text(item.name)
                }
            .onDelete(perform: removeItems)
            }
        .navigationBarTitle("iExpense")
            .navigationBarItems(trailing: Button(action: {
                let item = ExpenseItem(name: "Test", item: "IDK", amount: 5)
                
                self.expenses.items.append(item)
                
            }){Image(systemName: "plus")}
        )}
    }
    
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
