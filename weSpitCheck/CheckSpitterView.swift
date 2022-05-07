//
//  ContentView.swift
//  weSpitCheck
//
//  Created by Gokhan Bozkurt on 26.01.2022.
//

import SwiftUI

struct CheckSpitterView: View {
    

    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercent = 20
    @FocusState private var amountIsFocused : Bool
    
    // .currency(code: Locale.current.currencyCode ?? "USD") instead of this another way of using currency formatter
    let currencyFormat : FloatingPointFormatStyle<Double>.Currency = .currency(code: "JPY")
    
    
 //   let tipPercentages = [5,10,15,20,25,0]
    
    var totalPerPerson : Double {
        let peopleCount = Double(numberOfPeople + 1)
        let tipSelection = Double(tipPercent)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = tipValue + checkAmount
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var totalCheck : Double {
        let tipSelection = Double(tipPercent)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = tipValue + checkAmount
        return grandTotal
    }
    
    
    
    var body: some View {
        
        NavigationView {
            
            Form {
                    Section {
                        TextField("Amount", value : $checkAmount, format: currencyFormat)
                                      
                                       /* $checkAmount, format:
                                            .currency(code: Locale.current.currencyCode ?? "USD") ) */
                                    .keyboardType(.decimalPad)
                                    .focused($amountIsFocused)
                            
                            Picker("Number of People", selection : $numberOfPeople) {
                                ForEach(1..<99) {
                                    Text("\($0) people")
                                }
                            }
                    }
                  
                  Section {
                      Picker("Tip Percentage", selection: $tipPercent) {
                          ForEach(0..<101, id : \.self) {
                              Text($0, format: .percent)
                          }
                      }
                      // instead of segmented picker we choose list picker if you want to change use that below
                      /*.pickerStyle(.segmented)
                     .background(Color.green)*/
                  }  header: {
                      Text("How much tip do you want to leave?")
                  }
                Section {
                    Text(totalCheck, format: currencyFormat)
                        .foregroundColor(tipPercent == 0 ? .red : .black)
                          /*  Text(totalCheck, format :
                                            .currency(code: Locale.current.currencyCode ?? "USD")) */
                        } header: {
                            Text("Amount Total")
                        }
                      
                
                Section {
                         
                    Text(totalPerPerson, format: currencyFormat)
                    /*  Text(totalPerPerson, format :
                                            .currency(code: Locale.current.currencyCode ?? "USD")) */
                        } header: {
                            Text("Amount Per Person")
                        }
                    }.navigationTitle("Bill Splitter")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            amountIsFocused = false
                        }
                    }
                }
            
        }
      
    }
    }


struct CheckSpitterView_Previews: PreviewProvider {
    static var previews: some View {
        CheckSpitterView()
    }
}
