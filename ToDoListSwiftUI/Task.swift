//
//  Task.swift
//  ToDoListSwiftUI
//
//  Created by Intekglobal01 on 1/31/24.
//

import Foundation
import SwiftData

@Model
class Task {
    var title: String
    var taskDescription: String
    var isCompleted: Bool
    var completionDate: Date
    
    init(title: String, taskDescription: String, isCompleted: Bool, completionDate: Date) {
        self.title = title
        self.taskDescription = taskDescription
        self.isCompleted = isCompleted
        self.completionDate = completionDate
    }
}
