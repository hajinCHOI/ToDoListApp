//
//  ContentView.swift
//  ToDoApp
//
//  Created by 최하진 on 1/17/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query private var tasks: [todoTask]
    
    @State var newTask = todoTask(name: "")
    
    var body: some View {
        NavigationStack {
            VStack{
                
                List {
                    ForEach(tasks) { task in
                        ListCell(task: task)
                        
                    }
                    .onDelete(perform: deleteItems)
                    
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    
                    ToolbarItem {
                        NavigationLink(destination: ResultsView()) {
                            Label("Find Task", systemImage: "magnifyingglass")
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading){
                        Text("To Do")
                            .font(.title)
                    }
                }
                
                NavigationLink(destination: addNewTaskView(name: "", memo: "",  priority: .Middle, isFinished: true)) {
                    Label("Add Task", systemImage: "plus")
                }
            }
            
        }.navigationTitle("To Do List")
        
    }
    
    
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(tasks[index])
            }
        }
    }
    
}


#Preview {
    ContentView()
        .modelContainer(for: todoTask.self, inMemory: true)
}

struct ListCell: View {
    var task: todoTask
    
    var body: some View {
        HStack{
            Button(action: {
                if task.isFinished {
                    task.isFinished = false
                } else {
                    task.isFinished = true
                }
            }) {
                Text(Image(systemName: task.isFinished ?  "checkmark.square.fill" : "square"))
            }
            //Spacer()
            Text("\(task.priority)" )
            Spacer()
            Text("\(task.name)")
            
            Spacer()
            
            
            NavigationLink{
                UpdateTaskView(task: task)
            } label: {
                Image(systemName: "square.and.pencil")
            }
            
        }
    }
}

