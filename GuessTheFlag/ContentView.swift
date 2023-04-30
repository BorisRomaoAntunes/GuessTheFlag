//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Boris R on 27/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var pontos = 0
    
    @State private var coutries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
   @State private var correctAnswe =  Int.random(in: 0...2)
    
    var body: some View {
        ZStack{
            //            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
            //                .ignoresSafeArea()
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            
            .ignoresSafeArea()
            
            VStack{
                Spacer()
                
                Text("Guess the Flag")
                //    .font(.largeTitle.weight(.bold))
                //or
                    .font(.largeTitle.bold())
                
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                VStack (spacing: 15){
                    VStack{
                        Text("Tap the Flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(coutries[correctAnswe])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3){ number in
                        Button {
                           flagTapped(number)
                        
                        } label: {
                            Image(coutries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text ("Score: \(pontos)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
        }
            .alert(scoreTitle, isPresented: $showingScore){
                Button("Continue", action: askQueston)
            } message: {
                Text("Your scorre is \(pontos)")
        }
    }
    func flagTapped (_ number: Int){
        if number == correctAnswe {
            scoreTitle = "Correct 😃"
            pontos = pontos + 1
        } else {
            scoreTitle = "Wrong 🤦🏿‍♂️"
        }
        showingScore = true
    }
    func askQueston(){
        coutries.shuffle()
        correctAnswe = Int.random(in: 0...2)
    }
}
        
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
