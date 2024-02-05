//
//  DetailView.swift
//  ToDoListSwiftUI
//
//  Created by Intekglobal01 on 1/31/24.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    let task: Task
    var hasDateExpired: Bool {
        return task.completionDate < Date()
    }
    
    var body: some View {
        ScrollView {
            TaskCell(task: task)
            .padding(.bottom)
            
            Text("Description:")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(task.taskDescription)
                .frame(maxWidth: .infinity, alignment: .leading)
                
            
            
        }
        .padding()
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete task", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteTask)
            Button("Cancel", role: .cancel) { }
        } message: {
             Text("Are you sure?")
        }
        .toolbar {
            Button("Delete this task", systemImage: "trash") {
                showingDeleteAlert = true
            }
        }
        
    }
    
    func deleteTask() {
        modelContext.delete(task)
        dismiss()
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Task.self, configurations: config)
        let example = Task(title: "Test task", taskDescription: "This is a test description", isCompleted: false, completionDate: .now)
        return  DetailView(task: example )
            .modelContainer(container)
        
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
