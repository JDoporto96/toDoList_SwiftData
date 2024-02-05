//
//  TaskCell.swift
//  ToDoListSwiftUI
//
//  Created by Intekglobal01 on 1/31/24.
//

import SwiftUI
import SwiftData

struct TaskCell: View {
    @Environment(\.modelContext) var modelContext
    
    var task: Task
    
    var hasDateExpired: Bool {
        return task.completionDate < Date()
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(task.title)
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                   
            }
            HStack {
                Text(task.isCompleted ? "Completed" : (hasDateExpired ? "Incomplete" : "Pending"))
                    .font(.headline)
                    .foregroundStyle(task.isCompleted ? .green : (hasDateExpired ? .secondary : .red))
                    .frame(alignment: .leading)
                    .onTapGesture {
                        updateTask(task)
                    }
                
               Spacer()
                
                if !task.isCompleted {
                    Text("Due to: \(task.completionDate.formatted(date: .abbreviated, time: .omitted))")
                        .frame(alignment: .trailing)
                }
            }
        }
        
        
    }
    
    func updateTask(_ task: Task) {
        withAnimation {
            task.isCompleted.toggle()
        }
    }
}

#Preview {
    
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Task.self, configurations: config)
        let example = Task(title: "Test task", taskDescription: "This is a test description", isCompleted: false, completionDate: .now)
        return  TaskCell(task: example )
            .modelContainer(container)
        
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
