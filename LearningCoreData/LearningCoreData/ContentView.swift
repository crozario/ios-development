//
//  ContentView.swift
//  LearningCoreData
//
//  Created by Crossley Rozario on 5/2/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @StateObject var viewModel = ContentViewModel()
    //    @FetchRequest(
    //        sortDescriptors: [NSSortDescriptor(keyPath: \Item.title, ascending: true)],
    //        animation: .default)
    //    private var items: FetchedResults<Item>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.savedEntities) { word in
                    NavigationLink {
                        VStack {
                            Text(word.title ?? "Error")
                            Text(word.definition ?? "Error")
                        }
                    } label: {
                        Text(word.title ?? "Error")
                    }
                }
                .onDelete(perform: viewModel.deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: viewModel.addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
