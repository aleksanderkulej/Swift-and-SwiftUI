//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by AK Biznes on 25/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1
    
    
    var body: some View {
      
        ZStack {
            Image("background")
                .resizable().edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
                VStack {
                    Image("diceeLogo")
                    Spacer()
                    HStack {
                        DiceView(n:leftDiceNumber)
                        DiceView(n:rightDiceNumber)

                    }
                    .padding(.horizontal)
                    Spacer()
                    Button("Roll") {
                        self.leftDiceNumber = Int.random(in: 1...6)
                        self.rightDiceNumber = Int.random(in: 1...6)

                    }
                    .font(.system(size: 50))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .padding(.horizontal)
                }.padding()
                

               

            
        }
    }
}

#Preview {
    ContentView()
}

struct DiceView: View {
    
    let n: Int
    
    var body: some View {
        
            Image("dice\(n)")
            .resizable().aspectRatio(1, contentMode: .fit).padding()
            
        
    }
}
