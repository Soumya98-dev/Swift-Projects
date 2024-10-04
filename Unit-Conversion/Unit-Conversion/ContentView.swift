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
    
    let inputs = ["C", "F", "K"]
    
    //Computed Property
    var outputValue: Double{
        
        var outPut: Double = 0.0
        
        if inputUnit == "C" && outputUnit == "F"{
            outPut = (inputValue * 9/5) + 32
        }else if(inputUnit == "F" && outputUnit == "C"){
            outPut = (inputValue - 32) * 5/9
        }else if(inputUnit == "K" && outputUnit == "C"){
            outPut = inputValue - 273.15
        }else if(inputUnit == "C" && outputUnit == "K"){
            outPut = inputValue + 273.15
        }else if(inputUnit == "K" && outputUnit == "F"){
            outPut = (inputValue - 273.15) * 9/5 + 32
        }else if(inputUnit == "F" && outputUnit == "K"){
            outPut = (inputValue - 32) * 5/9 + 273.15
        }
        else{
            outPut = inputValue
        }
        
        return outPut
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Input Unit:"){
                    unitPicker(title: "Input Unit:", binding: $inputUnit, data: inputs)
                }
                Section("Output Unit:"){
                    unitPicker(title: "Output Unit:", binding: $outputUnit, data: inputs)
                }
                Section("Enter Value:"){
                    HStack{
                        TextField("Enter Value", value: $inputValue, format:.number.precision(.fractionLength(2)))
                            .keyboardType(.decimalPad)
                            Text(inputUnit)
                    }
                }
                Section("Output"){
                    HStack{
                        Text(outputValue, format: .number.precision(.fractionLength(2)))
                            .multilineTextAlignment(.center)
                        Text(outputUnit)
                            .padding(.leading,5)
                    }
                    .padding(2)
                    .font(.title3)
                }
            }
            .navigationTitle("Temperature Conversion")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
    
    func unitPicker(title: String, binding: Binding<String>, data: [String]) -> some View{
        Picker(title, selection: binding){
            ForEach(data , id:\.self){da in
                Text(da)
                
            }
        }
        .pickerStyle(.segmented)
    }
}

#Preview {
    ContentView()
}
