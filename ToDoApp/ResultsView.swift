//
//  ResultsView.swift
//  ToDoApp
//
//  Created by 최하진 on 1/17/25.
//

import SwiftUI
import SwiftData

struct ResultsView: View {
    @State var name: String = ""
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var matches: [todoTask] = []
    
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Image(systemName: "magnifyingglass")
                TextField("Enter Task", text: $name)
                
                Button("Research") {
                    Task {
                        let descriptor = FetchDescriptor<todoTask>(predicate: #Predicate<todoTask> { $0.name.contains( name )})
                        do {
                            matches = try modelContext.fetch(descriptor)
                        } catch {
                            print("Error fetching products: \(error)")
                            matches = []
                        }
                    }
                }
                Spacer()
            }
            List {
                ForEach(matches) { task in
                    HStack {
                        Text(task.name)
                        Spacer()
                        Text(Image(systemName: task.isFinished ? "checkmark.square.fill" : "square" ))
                    }
                }
            }
            .navigationTitle("Results")
        }
        
    }
}

#Preview {
    ResultsView(name: "test")
        .modelContainer(for: todoTask.self, inMemory: true)
}
