//
//  ContentView.swift
//  bowlingScore
//
//  Created by Vincent Niyitanga on 5/31/24.
//

import SwiftUI

struct ContentView: View {
    @State private var game1 = ""
    @State private var game2 = ""
    @State private var game3 = ""
    @State private var series = 0
    @State private var average = 0
    @State private var high = 0
    
    var body: some View {
        VStack {
            // MARK: Bowling Scores
            Text("Bowling Scores")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .padding(.top, 20)
            
            // Spacer()
            
//            // MARK: Image Bowling
//            Image("BowlingPic")
//                .resizable()
//                //.scaledToFit()
//                .frame(height: 200)
//                .padding(.top, 5)
            
            // MARK: Game Scores Input
            Group {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Game 1")
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.yellow)
                            .accessibilityLabel("game1label")
                        
                        Text("Game 2")
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.yellow)
                            .accessibilityLabel("game2label")
                        
                        Text("Game 3")
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.yellow)
                            .accessibilityLabel("game3label")
                    }
                    
                    VStack(alignment: .trailing) {
                        TextField("0", text: $game1)
                            .keyboardType(.numberPad)
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .background(Color.red)
                            .accessibilityLabel("game1")
                        
                        TextField("0", text: $game2)
                            .keyboardType(.numberPad)
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .background(Color.red)
                            .accessibilityLabel("game2")
                        
                        TextField("0", text: $game3)
                            .keyboardType(.numberPad)
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .background(Color.red)
                            .accessibilityLabel("game3")
                    }
                }
            }
            
            // MARK: Calculate Button
            Button(action: calculateScores) {
                Text("Calculate")
                    .foregroundColor(.blue)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(8)
                    .accessibilityLabel("calculate")
            }
            .padding(.vertical, 20)
            
            
            
            
            // MARK: Results
            Group {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Series")
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.yellow)
                            .accessibilityLabel("serieslabel")
                        
                        Text("Average")
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.yellow)
                            .accessibilityLabel("averagelabel")
                        
                        Text("High")
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.yellow)
                            .accessibilityLabel("highlabel")
                    }
                    
                    VStack(alignment: .trailing) {
                        Text("\(series)")
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .background(Color.blue)
                            .accessibilityLabel("series")
                        
                        Text("\(average)")
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .background(Color.blue)
                            .accessibilityLabel("average")
                        
                        Text("\(high)")
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .background(Color.blue)
                            .accessibilityLabel("high")
                    }
                }
            }
            
            .padding()
            
//            // MARK: Reset Button
//            Button(action: resetFields) {
//                Text("Refresh")
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.black)
//                    .cornerRadius(8.0)
//                    .accessibilityLabel("Refresh")
//                
//            }
            
            Spacer()
        }
        .padding()
        .background(Color(UIColor.lightGray))
    }
    
    func calculateScores() {
        // Convert text fields to integers, treating non-integer and empty fields as 0
        let score1 = Int(game1) ?? 0
        let score2 = Int(game2) ?? 0
        let score3 = Int(game3) ?? 0
        
        // Filter out zero scores
        let scores = [score1, score2, score3].filter { $0 > 0 }
        
        // Calculate series, average and high
        series = scores.reduce(0, +)
        
        if scores.count > 0 {
            average = series / scores.count
        } else {
            average = 0
        }
        
        high = scores.max() ?? 0
    }
    
    func resetFields() {
            game1 = ""
            game2 = ""
            game3 = ""
            series = 0
            average = 0
            high = 0
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}

