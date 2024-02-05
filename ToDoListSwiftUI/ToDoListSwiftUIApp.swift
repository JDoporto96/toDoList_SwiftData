//
//  ToDoListSwiftUIApp.swift
//  ToDoListSwiftUI
//
//  Created by Intekglobal01 on 1/31/24.
//


import SwiftData
import SwiftUI

@main
struct ToDoListSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
