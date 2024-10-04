//
//  ContentView.swift
//  Unit-Conversion
//
//  Created by Soumyadeep Chatterjee on 10/3/24.
//

import SwiftUI

enum TemperatureUnit: String, CaseIterable {
    case Celsius = "C"
    case Kelvin = "K"
    case Fahrenheit = "F"
}


struct ContentView: View {
    @State private var inputUnit = TemperatureUnit.Celsius
    @State private var outputUnit = TemperatureUnit.Fahrenheit
    @State private var inputValue:Double = 2.0
    
    //Computed Property
    var outputValue: Double{
        
//        var outPut: Double = 0.0
//        
//        if inputUnit == "C" && outputUnit == "F"{
//            outPut = (inputValue * 9/5) + 32
//        }else if(inputUnit == "F" && outputUnit == "C"){
//            outPut = (inputValue - 32) * 5/9
//        }else if(inputUnit == "K" && outputUnit == "C"){
//            outPut = inputValue - 273.15
//        }else if(inputUnit == "C" && outputUnit == "K"){
//            outPut = inputValue + 273.15
//        }else if(inputUnit == "K" && outputUnit == "F"){
//            outPut = (inputValue - 273.15) * 9/5 + 32
//        }else if(inputUnit == "F" && outputUnit == "K"){
//            outPut = (inputValue - 32) * 5/9 + 273.15
//        }
//        else{
//            outPut = inputValue
//        }
//        
//        return outPut
        
        switch inputUnit{
        case TemperatureUnit.Celsius:
            if (outputUnit == TemperatureUnit.Fahrenheit){
                return (inputValue * 9/5) + 32
            }else if (outputUnit == TemperatureUnit.Kelvin){
                return inputValue + 273.15
            }
        case TemperatureUnit.Kelvin:
            if (outputUnit == TemperatureUnit.Celsius){
                return inputValue - 273.15
            }else if (outputUnit == TemperatureUnit.Fahrenheit){
                return (inputValue - 273.15) * 9/5 + 32
            }
        case TemperatureUnit.Fahrenheit:
            if (outputUnit == TemperatureUnit.Celsius){
                return (inputValue - 32) * 5/9
            }else if (outputUnit == TemperatureUnit.Kelvin){
                return (inputValue - 32) * 5/9 + 273.15
            }
        }
        return inputValue
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Input Unit:"){
                    unitPicker(title: "Input Unit:", binding: $inputUnit)
                }
                Section("Output Unit:"){
                    unitPicker(title: "Output Unit:", binding: $outputUnit)
                }
                Section("Enter Value:"){
                    HStack{
                        TextField("Enter Value", value: $inputValue, format:.number.precision(.fractionLength(2)))
                            .keyboardType(.decimalPad)
                        Text(inputUnit.rawValue)
                    }
                }
                Section("Output"){
                    HStack{
                        Text(outputValue, format: .number.precision(.fractionLength(2)))
                            .multilineTextAlignment(.center)
                        Text(outputUnit.rawValue)
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
    
    func unitPicker(title: String, binding: Binding<TemperatureUnit>) -> some View{
        Picker(title, selection: binding){
            ForEach( TemperatureUnit.allCases, id:\.self){da in
                Text(da.rawValue).tag(da)
                
            }
        }
        .pickerStyle(.segmented)
    }
}

#Preview {
    ContentView()
}
