//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by 최하진 on 1/17/25.
//

import SwiftUI
import SwiftData

@main
struct ToDoAppApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            todoTask.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
