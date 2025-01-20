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
    
    @State var name: String
    @State var priority: todoPriority = .Middle
    @State var isFinished: Bool = false
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack{
            Text("New Task")
                .multilineTextAlignment(.center)
            
            Form{
                Section(header: Text("New Task")) {
                    
                    TextField(text: $name, prompt: Text("Enter new task name")) {
                        Text("Task")
                    }
                    
                    Picker(selection: $priority){
                        Text("High").tag(todoPriority.High)
                        Text("Middle").tag(todoPriority.Middle)
                        Text("Low").tag(todoPriority.Low)
                    } label: {
                        Text("Priotity")
                    }
                    
                    Toggle("Finished", isOn: $isFinished)
                }
            }
            .toolbar {
                Button("Save"){
                    let task = todoTask(name: name, priority: priority, isFinished: isFinished)
                    modelContext.insert(task)
                    do {
                        try modelContext.save()
                    } catch {
                        
                    }
                    dismiss()//현재 화면을 dismiss 해서 이전 화면으로 돌아감
                }
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    NavigationLink(destination: ContentView(), label: {
//                        Text("Save")
//                })
//                    .simultaneousGesture(TapGesture().onEnded{
//                        modelContext.insert(newTask)
//                    }) // 네비게이션 링크 버튼 탭 시 액션 추가
                }
            }
        }
    }


#Preview {
    addNewTaskView(name: "", priority: .Middle, isFinished: false)
}
