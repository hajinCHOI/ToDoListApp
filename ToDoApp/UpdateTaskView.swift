//
//  UpdateTaskView.swift
//  ToDoApp
//
//  Created by 최하진 on 1/17/25.
//

import SwiftUI

struct UpdateTaskView: View {
    @Environment(\.dismiss) var dismiss
    
    @Bindable var task: todoTask
    
    var body: some View {
        VStack{
            Text("Task")
                .multilineTextAlignment(.center)
            
            Form{
                Section(header: Text("Task")) {
                    
                    TextField("Task", text: $task.name)
                    
                    Picker(selection: $task.priority){
                        Text("High").tag(todoPriority.High)
                        Text("Middle").tag(todoPriority.Middle)
                        Text("Low").tag(todoPriority.Low)
                    } label: {
                        Text("Priotity")
                    }
                    
                    Toggle("Finished", isOn: $task.isFinished)
                }
            }
            .toolbar {
                Button("Update"){
                    dismiss()//현재 화면을 dismiss 해서 이전 화면으로 돌아감
                }
                
            }
        }
    }
}

//#Preview {
//    UpdateTaskView()
//}
