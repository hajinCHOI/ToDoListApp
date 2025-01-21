//
//  addnewTaskView.swift
//  ToDoApp
//
//  Created by 최하진 on 1/17/25.
//

import SwiftUI
import SwiftData

struct addNewTaskView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var name: String = ""
    @State var memo: String = ""
    @State var priority: todoPriority = .Middle
    @State var isFinished: Bool = false
    @State var deadline: Date = Date()
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack{
            Text("New Task")
                .multilineTextAlignment(.center)
            
            Form{
                
                    TextField(text: $name, prompt: Text("New Task")) {
                        Text("Task")
                    }
                    
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
                Button("Save"){
                    let task = todoTask(name: name, memo, priority: priority, isFinished: isFinished)
                    modelContext.insert(task)
                    do {
                        try modelContext.save()
                    } catch {
                        
                    }
                    dismiss()//현재 화면을 dismiss 해서 이전 화면으로 돌아감
                }

                }
            }
        }
    


#Preview {
    addNewTaskView(name: "", memo: "", priority: .Middle, isFinished: false, deadline: Date.now)
}
