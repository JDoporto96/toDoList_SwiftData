//
//  ContentView.swift
//  ToDoListSwiftUI
//
//  Created by Intekglobal01 on 1/31/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var tasks: [Task]
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks) { task in
                    NavigationLink(value: task) {
                       TaskCell(task: task)
                    }
                }
                .onDelete(perform: deleteTask)
                
            }
            .navigationTitle("Tasks")
            .navigationDestination(for: Task.self) { task in
                DetailView(task: task)
            }
            .toolbar{
                Button("add", systemImage: "plus") {
                    showingAddScreen.toggle()
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddTaskView()
            }
        }
    }
    
    func deleteTask (at offsets: IndexSet) {
        for offset in offsets {
            let task = tasks[offset]
            modelContext.delete(task)
        }
    }
}

#Preview {
    ContentView()
}
