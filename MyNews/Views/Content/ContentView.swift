//
//  ContentView.swift
//  MyNews
//
//  Created by Aliaksandr Pustahvar on 28.04.23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {
        TabView {
            NewsView()
                .tabItem {
                    Image(systemName: "doc.richtext")
                    Text("News")
                }
            SavedArticlesView()
                .tabItem {
                    Image(systemName: "folder")
                    Text("Saved articles")
                }
        }.tint(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
