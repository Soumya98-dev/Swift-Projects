//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Soumyadeep Chatterjee on 10/8/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)

    var body: some View {
        ZStack{
            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack{
                Text("Tap the flag off")
                    .font(.subheadline.weight(.heavy))
                    .foregroundStyle(.white)
                Text(countries[correctAnswer])
                    .font(.largeTitle.weight(.semibold))
                    .foregroundStyle(.white)
            }
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("continue", action: askQuestion)
        }message: {
            Text("Your score is \(userScore)")
        }
            ForEach(0..<3){flag in
                Button{
                    flagTapped(number: flag)
                }label: {
                    Image(countries[flag])
                        .clipShape(.capsule)
                        .shadow(radius: 5)
                        .padding()
                }
            }
    }
    
    func flagTapped(number: Int){
        if number == correctAnswer{
            scoreTitle = "correct"
            userScore = userScore + 1
        }else{
            scoreTitle = "wrong"
        }
        
        showingScore = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
