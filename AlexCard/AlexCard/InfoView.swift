//
//  InfoView.swift
//  AlexCard
//
//  Created by AK Biznes on 24/01/2024.
//

import SwiftUI

struct InfoView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 20).frame(height: 40.0).foregroundColor(.white).padding()
            HStack {
                Image(systemName: imageName)
                Text(text)
            }
        }
    }
}


#Preview {
    InfoView(text: "+48 608 200 909", imageName: "phone.circle.fill").previewLayout(.sizeThatFits)
}
