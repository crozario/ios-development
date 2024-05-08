//
//  ContentViewModel.swift
//  LearningCoreData
//
//  Created by Crossley Rozario on 5/4/24.
//

import SwiftUI
import CoreData

class ContentViewModel: ObservableObject {
    private var persistenceController: PersistenceController
    
    @Published var savedEntities = [VocabularyWordEntity]()
    
    init() {
        persistenceController = PersistenceController.shared
        fetchVocabularyWords()
    }
    
    
    func fetchVocabularyWords() {
        let request = NSFetchRequest<VocabularyWordEntity>(entityName: "VocabularyWordEntity")
        
        do {
            savedEntities = try persistenceController.container.viewContext.fetch(request)
        } catch let error {
            print("ERROR FETCHING ENTITY: \(error)")
        }
    }
    
    func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { savedEntities[$0] }.forEach(persistenceController.container.viewContext.delete)
            applyChanges()
        }
    }
    
    func addItem() {
        withAnimation {
            let newItem = VocabularyWordEntity(context: persistenceController.container.viewContext)
            
            newItem.title = Common.generateRandomString(length: 8)
            newItem.definition = Common.generateRandomString(length: 20)
            applyChanges()
        }
    }
    
    func applyChanges() {
        save()
        fetchVocabularyWords()
    }
    
    
    func save() {
        let context = persistenceController.container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("ERROR SAVING DATA")
            }
        }
    }
}
