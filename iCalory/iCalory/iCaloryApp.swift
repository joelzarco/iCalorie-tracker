//
//  iCaloryApp.swift
//  iCalory
//
//  Created by sergio joel camacho zarco on 17/07/23.
//

import SwiftUI

@main
struct iCaloryApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView() // inject into whole app :)
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
