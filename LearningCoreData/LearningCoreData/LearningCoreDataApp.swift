//
//  LearningCoreDataApp.swift
//  LearningCoreData
//
//  Created by Crossley Rozario on 5/2/24.
//

import SwiftUI

@main
struct LearningCoreDataApp: App {
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _, _ in
            persistenceController.save()
        }
    }
}
