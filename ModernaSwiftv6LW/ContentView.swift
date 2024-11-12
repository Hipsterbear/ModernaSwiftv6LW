//
//  ContentView.swift
//  ModernaSwiftv6LW
//
//  Created by L W on 2024-11-12.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks: [Task] = []
    @State private var isPresentingNewTaskView = false  // Controls the sheet

    var body: some View {
        NavigationView {
            List {
                ForEach(tasks) { task in
                    HStack {
                        Text(task.title)
                        Spacer()
                        if task.isCompleted {
                            Text("Done")
                                .foregroundColor(.green)
                        }
                    }
                    .onTapGesture {
                        toggleTaskCompletion(task)
                    }
                }
            }
            .navigationTitle("To-Do List")
            .toolbar {
                Button(action: { isPresentingNewTaskView = true }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $isPresentingNewTaskView) {
                NewTaskView { taskTitle in
                    addTask(title: taskTitle)
                }
            }
        }
    }

    // Private helper functions should be at the top level inside ContentView, not nested
    private func toggleTaskCompletion(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
            sortTasks()
        }
    }

    private func addTask(title: String) {
        tasks.append(Task(title: title))  // Pass the title to the initializer
        sortTasks()
    }

    private func sortTasks() {
        tasks.sort { !$0.isCompleted && $1.isCompleted }
    }
}

