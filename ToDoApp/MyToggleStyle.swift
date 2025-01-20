//
//  MyToggleStyle.swift
//  ToDoApp
//
//  Created by 최하진 on 1/17/25.
//

import SwiftUI

struct MyToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Image(systemName: configuration.isOn ?  "checkmark.square.fill" : "square")
            .onTapGesture {
                        withAnimation {
                          configuration.$isOn.wrappedValue.toggle()
                        }
                      }
    }
}
