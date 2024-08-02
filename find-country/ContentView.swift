//
//  ContentView.swift
//  find-country
//
//  Created by Динмуханбет Айжарыков on 02.08.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["UK", "USA", "Bangladesh", "Germany", "Argentina", "Brazil", "Canada", "Greece", "Russia", "Sweden"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black, .accentColor]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack(spacing: 50) {
                VStack {
                    Text("Choose country:").foregroundColor(.white).font(.headline)
                    Text(countries[correctAnswer]).foregroundColor(.white).font(.largeTitle).fontWeight(.black)
                }
                ForEach(0..<3) {
                    number in Button (action: {
                        self.flagTapped(number)
                        self.showingScore = true
                    }) {
                        Image(self.countries[number]).renderingMode(.original).frame(width: 250, height: 140).shadow(radius: 10)
                    }
                }
                Text("Your score: \(score)").font(.largeTitle).fontWeight(.bold)
                
                Spacer()
            }
        }.alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score: \(score)"), dismissButton: .default(Text("Contenue")) {
                self.askQuestion()
            })
            
        }
    }
    func askQuestion() {
        countries.shuffle()
        correctAnswer - Int.random(in: 0...2 )
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct answer"
            score += 1
        } else {
            scoreTitle = "Incorrect! This flag is \(countries[number])"
            score -= 1
        }
    }
}















#Preview {
    ContentView()
}
