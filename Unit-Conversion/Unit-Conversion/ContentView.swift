//
//  ContentView.swift
//  Unit-Conversion
//
//  Created by Soumyadeep Chatterjee on 10/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = "C"
    @State private var outputUnit = "F"
    @State private var inputValue:Double = 2.0
    @State private var outputValue: Double = 0.0
    
    let inputs = ["C", "F"]
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Input Unit:"){
                    unitPicker(title: "Input Unit:", binding: $inputUnit, data: inputs)
                }
                Section("Output Unit:"){
                    unitPicker(title: "Input Unit:", binding: $outputUnit, data: inputs)
                }
                Section("Enter Value:"){
                    HStack{
                        TextField("", value: $inputValue, format:.number.precision(.fractionLength(2)))
                            .keyboardType(.decimalPad)
                            Text(inputUnit)
                    }
                }
            }
            Section("Output"){
                HStack{
                    TextField("", value:$outputValue, format: .number.precision(.fractionLength(2)))
                        .multilineTextAlignment(.center)
                        .frame(width:50)
                    Text(outputUnit)
                        .frame(width:10)
                }
            }
            .navigationTitle("Temperature Conversion")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
    
    func unitPicker(title: String, binding: Binding<String>, data: [String]) -> some View{
        Picker(title, selection: binding){
            ForEach(data, id:\.self){da in
                Text(da)
                
            }
        }
        .pickerStyle(.segmented)
    }
}

#Preview {
    ContentView()
}
