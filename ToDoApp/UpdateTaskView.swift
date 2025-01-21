//
//  UpdateTaskView.swift
//  ToDoApp
//
//  Created by 최하진 on 1/17/25.
//

import SwiftUI

struct UpdateTaskView: View {
    @Environment(\.dismiss) var dismiss
    
    let task: todoTask
    
    @State private var name: String = ""
    @State private var memo: String = ""
    @State private var priority: todoPriority = .Middle
    @State private var isFinished: Bool = false
    @State private var deadline: Date = Date()

    init(task: todoTask) {
        self.task = task
        self._name = State(initialValue: task.name)
        self._memo = State(initialValue: task.memo)
        self._priority = State(initialValue: task.priority)
        self._isFinished = State(initialValue: task.isFinished)
        self._deadline = State(initialValue: task.deadline)
    }
    
    var body: some View {
        VStack{
            Text("Task")
                .multilineTextAlignment(.center)
            
            Form{
                Section(header: Text("Task")) {
                    
                    TextField("Task", text: $name)
                    
                    Picker(selection: $priority){
                        Text("High").tag(todoPriority.High)
                        Text("Middle").tag(todoPriority.Middle)
                        Text("Low").tag(todoPriority.Low)
                    } label: {
                        Text("Priotity")
                    }
                    
                    DatePicker(
                        "DeadLine",
                        selection:  $deadline,
                        displayedComponents: [.date]
                    )
                    
                    Toggle("Finished", isOn: $isFinished)
                    
                    let type = "Memo"
                    
                    ZStack(alignment: .topLeading, content: {
                        if memo.isEmpty {
                            Text(type)
                                .foregroundStyle(Color.primary.opacity(0.25))
                        }
                        
                        TextEditor(text: $memo)
                            .frame(height: 200)
                    })
                }
                
                
            }
            .toolbar {
                Button("Update"){
                    task.name = name
                    task.memo = memo
                    task.priority = priority
                    task.isFinished = isFinished
                    task.deadline = deadline
                    dismiss()//현재 화면을 dismiss 해서 이전 화면으로 돌아감
                }
                
            }
        }
    }
}

//#Preview {
//    UpdateTaskView()
//}
