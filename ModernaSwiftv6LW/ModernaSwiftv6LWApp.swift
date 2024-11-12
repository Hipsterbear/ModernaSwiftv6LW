//
//  ModernaSwiftv6LWApp.swift
//  ModernaSwiftv6LW
//
//  Created by L W on 2024-11-12.
//
import SwiftUI
import SwiftData

@main
struct ModernaSwiftv6LWApp: App {

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Task.self,
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

