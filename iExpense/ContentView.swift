//
//  ContentView.swift
//  iExpense
//
//  Created by Aaryan Kothari on 24/02/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    var body: some View {
        VStack {
            List{
                ForEach(numbers, id: \.self){
                    Text("\($0)")
                }
                .onDelete(perform: removeRow)
            }
            
            Button("Add Number"){
                self.numbers.append(self.currentNumber)
                self.currentNumber += 1
            }
        }
    }
    
   func removeRow(at offsets:IndexSet){
        numbers.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
