//
//  ContentView.swift
//  iExpense
//
//  Created by Aaryan Kothari on 24/02/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import SwiftUI

struct User: Codable {
    var firstName : String //= "Aaryan"
    var secondName : String  //= "Kothari"
}

struct ContentView: View {
    @State private var user = User(firstName: "Aaryan", secondName: "Kothari")
    var body: some View {
        Button("Save Data"){
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(self.user){
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
