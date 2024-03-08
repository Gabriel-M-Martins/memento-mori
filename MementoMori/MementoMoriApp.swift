//
//  MementoMoriApp.swift
//  MementoMori
//
//  Created by Gabriel Medeiros Martins on 08/03/24.
//

import SwiftUI
import SwiftData

@main
struct MementoMoriApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Profile.self,
            Day.self,
            Author.self,
            Quote.self,
            Book.self
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
            NavigationStack {
                CalendarView()
            }
            .preferredColorScheme(.light)
        }
        .modelContainer(sharedModelContainer)
    }
}
