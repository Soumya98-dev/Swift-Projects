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
    //8 questions
    //Question Counter
    @State private var questionCounter = 0
    //Show the final score after 8 questions
    @State private var showingFinalScore = false
    @State private var finalScoreTitle = ""

    @State private var countries = [
        "Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland",
        "Spain", "UK", "Ukraine", "US",
    ].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)

    var body: some View {
        ZStack {
            RadialGradient(
                stops: [
                    .init(
                        color: Color(red: 0.1, green: 0.2, blue: 0.45),
                        location: 0.3),
                    .init(
                        color: Color(red: 0.76, green: 0.15, blue: 0.26),
                        location: 0.3),
                ], center: .top, startRadius: 200, endRadius: 400
            )
            .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)

                VStack(spacing: 15) {
                    Text("Tap the flag off")
                        .font(.subheadline.weight(.heavy))
                        .foregroundStyle(.secondary)
                    Text(countries[correctAnswer])
                        .font(.largeTitle.weight(.semibold))
                    //                        .foregroundStyle(.white)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                Spacer()
                Spacer()
                Text("Score: \(userScore)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
            }.padding()

        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("continue", action: askQuestion)
        } message: {
            Text("Your score is \(userScore)")
        }
        .alert(finalScoreTitle, isPresented: $showingFinalScore) {
            Button("reset", action: reset)
        } message: {
            Text("Total score is \(userScore). Restart the game")
        }

        ForEach(0..<3) { flag in
            Button {
                flagTapped(number: flag)
            } label: {
                Image(countries[flag])
                    .clipShape(.capsule)
                    .shadow(radius: 5)
                    .padding()
            }
        }
    }

    func flagTapped(number: Int) {

        if number == correctAnswer {
            scoreTitle = "correct"
            userScore = userScore + 1
        } else {
            scoreTitle = "wrong, that's the flag of \(countries[number])"
            userScore = userScore - 1
        }

        questionCounter = questionCounter + 1

        if questionCounter == 8 {
            finalScoreTitle = "Game Over"
            showingFinalScore = true
        } else {
            showingScore = true
        }

    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }

    //Reset
    func reset() {
        userScore = 0
        questionCounter = 0
        countries.shuffle()
    }
}

#Preview {
    ContentView()
}
