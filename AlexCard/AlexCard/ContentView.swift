//
//  ContentView.swift
//  AlexCard
//
//  Created by AK Biznes on 24/01/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        ZStack {
            Color(red: 0.87, green: 0.89, blue: 0.92)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Image("AK")
                    .resizable().aspectRatio(contentMode: .fit).frame(width: 200.0, height: 150).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).overlay(Circle().stroke(Color.white, lineWidth: 5))
                Text("Aleksander Kulej")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .bold()
                .foregroundColor(.black)
                Text("iOS Developer")
                    .foregroundColor(.black)
                    .font(.system(size: 25))
                Divider()
                InfoView(text: "+48 608 200 909", imageName: "phone.circle.fill")
                InfoView(text: "alexanderkulej@gmail.com", imageName: "envelope.fill")

            }
        }
      
    }
}

#Preview {
    ContentView()
}

