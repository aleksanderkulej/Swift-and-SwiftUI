//
//  DetailView.swift
//  Hacker News
//
//  Created by AK Biznes on 25/01/2024.
//

import SwiftUI


struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}


struct DetailView_Previews: PreviewProvider {
    static var  previews: some View {
        DetailView(url: "www.apple.com")
    }
}



