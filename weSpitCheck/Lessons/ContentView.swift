//
//  ContentView.swift
//  WeSplit
//
//  Created by Gokhan Bozkurt on 25.01.2022.
//

import SwiftUI

struct ContentView: View {
  @State private  var topCount = 0
    @State private var name = ""
    
    var body: some View {
        
            NavigationView{
              
                Form {
               
                    Section {
                        TextField("Enter Name", text : $name)
                     Text("Your name is \(name)")
                        
                
                }
                    Section {
                    Text("Hello, world!")
                    Text("Hello, world!")
                        Button("BAS : \(topCount)") {
                            topCount += 1
                       
                        }

                }
                }.navigationTitle("SWIFTUI")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
