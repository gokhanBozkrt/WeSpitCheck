//
//  ContentView3.swift
//  WeSplit
//
//  Created by Gokhan Bozkurt on 26.01.2022.
//

import SwiftUI


struct ContentView3 : View {
    let students = ["Rom","Tom","Ali"]
     @State private var selecttedStudents = "Ali"
    
    var body: some View {
        NavigationView{
            Form{
                Picker("Select your student", selection: $selecttedStudents) {
                    ForEach(students, id : \.self) {
                        Text($0)
                    }
                }
                
            }.navigationTitle("SWIFTUI")
                .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}
