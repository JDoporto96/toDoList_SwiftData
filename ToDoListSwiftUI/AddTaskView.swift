//
//  AddTaskView.swift
//  ToDoListSwiftUI
//
//  Created by Intekglobal01 on 1/31/24.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var taskDescription = ""
    @State private var completionDate = Date.now
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("New Task", text: $title)
                }
                Section("Description") {
                    TextEditor(text: $taskDescription)
                    
                    DatePicker("Complete before:", selection: $completionDate, displayedComponents: .date)
                        .datePickerStyle(.compact)
                }
                
                Section{
                    Button("Save") {
                        let newTask = Task(title: title, taskDescription:taskDescription, isCompleted: false, completionDate: completionDate)
                        modelContext.insert(newTask)
                        dismiss()
                    }
                }
                .disabled(title.isEmpty)
            }
            .navigationTitle("New Task")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddTaskView()
}
