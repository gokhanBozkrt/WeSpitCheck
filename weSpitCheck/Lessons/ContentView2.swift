//
//  ContentView2.swift
//  WeSplit
//
//  Created by Gokhan Bozkurt on 26.01.2022.
//

import SwiftUI

struct ContentView2 : View {
    var body: some View {
     
        NavigationView {
            Form {
                ForEach(0..<100) { number in
                    Text("Row \(number)")
                  /* same thing
                   ForEach(0..<100) {
                       Text("Row \($0)")
                */
                    
                }
            }.navigationTitle("SWIFTUI")
                .navigationBarTitleDisplayMode(.inline)
                .padding()
        }
        
  
    }
}


struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
