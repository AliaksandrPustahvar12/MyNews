//
//  MyNewsApp.swift
//  MyNews
//
//  Created by Aliaksandr Pustahvar on 28.04.23.
//

import SwiftUI

@main
struct MyNewsApp: App {
  
    let dataBaseService = DataBaseService.shared
   
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataBaseService.context)
        }
    }
}
