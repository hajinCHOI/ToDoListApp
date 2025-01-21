//
//  Item.swift
//  ToDoApp
//
//  Created by 최하진 on 1/17/25.
//

import Foundation
import SwiftData

enum todoPriority : Codable {
    case High
    case Middle
    case Low
}

@Model
final class todoTask {
    var name : String
    var priority : todoPriority 
    var isFinished : Bool
    var date : Date
    var deadline : Date
    var memo : String
    
    init(name: String,_ memo: String = "", priority: todoPriority = .Middle, isFinished: Bool = false ,_ dedline: Date = .now , _ date: Date = .now) {
        self.name = name
        self.memo = memo
        self.priority = priority
        self.isFinished = isFinished
        self.deadline = dedline
        self.date = date
    }
}
