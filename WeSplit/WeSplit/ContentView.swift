//
//  ContentView.swift
//  WeSplit
//
//  Created by Soumyadeep Chatterjee on 9/30/24.
//
//Check Splitting App:
//1. users need to be able to enter the cost of the check
//2. no of people sharing the cost
//3. amt of tip they want ot leave

import SwiftUI

struct ContentView: View {
    //State properties for the above 3 values
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 1
    @State private var tipPercentage = 0
    
    //Choice of tips
    let tipPercentages = [5, 10, 15, 20,0]
    
    //Computed Property
    var totalPerPerson: Double{
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = (checkAmount / 100) * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code:Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                }
                Section("How much tip you want to leave?"){
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach(tipPercentages, id:\.self){Tip in
                            Text(Tip, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section{
                    Picker("Number of People", selection: $numberOfPeople){
                        ForEach(1..<100){ People in
                            Text("\(People) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
            }
            .navigationTitle("WeSplit")
            Section{
                Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            }
        }
    }
}

#Preview {
    ContentView()
}
