//
//  ContentView.swift
//  I Am Rich SUI
//
//  Created by AK Biznes on 24/01/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            Color(.systemTeal)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("I Am Rich")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                .foregroundColor(Color.white)
                Image("diamond").resizable().aspectRatio(contentMode: .fit).frame(width: 200.0, height: 200.0, alignment: .center)
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}
