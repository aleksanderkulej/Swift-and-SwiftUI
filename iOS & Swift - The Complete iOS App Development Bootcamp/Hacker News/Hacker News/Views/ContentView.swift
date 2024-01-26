//
//  ContentView.swift
//  Hacker News
//
//  Created by AK Biznes on 25/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    
    var body: some View {
        
        
        NavigationView {
            List(networkManager.posts) {
                post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                        
                    }
                }
                
            }
            .navigationBarTitle("Hacker News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

#Preview {
    ContentView()
}



//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Czesc"),
//    Post(id: "3", title: "Hola")
//
//]
