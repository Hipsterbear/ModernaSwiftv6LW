//
//  NewTaskView.swift
//  ModernaSwiftv6LW
//
//  Created by L W on 2024-11-12.
//

import SwiftUI

struct NewTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var taskTitle: String = ""
    var onSave: (String) -> Void

    var body: some View {
        VStack {
            Text("Add a New Task")
                .font(.headline)
                .padding()

            TextField("Task Name", text: $taskTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Save") {
                if !taskTitle.isEmpty {
                    onSave(taskTitle)
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .disabled(taskTitle.isEmpty)
            .padding()
        }
        .padding()
    }
}
