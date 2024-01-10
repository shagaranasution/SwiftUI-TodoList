//
//  TLTodoStatusView.swift
//  TodoList
//
//  Created by Shagara F Nasution on 25/12/23.
//

import SwiftUI

public struct TLTodoStatusView: View {
    
    @EnvironmentObject private var viewModel: TLTodoViewModel
    public let todo: TodoEntity
    public let disabled: Bool
    
    public init(
        todo: TodoEntity,
        disabled: Bool = false
    ) {
        self.todo = todo
        self.disabled = disabled
    }
    
    public var body: some View {
        let imageName: String = todo.completed ? "checkmark.seal.fill" : "circle"
        let width: CGFloat = todo.completed ? 28 : 24
        let height: CGFloat = width
        
        return Image(systemName: imageName)
            .resizable()
            .frame(width: width)
            .frame(height: height)
            .offset(x: todo.completed ? 2 : 0)
            .offset(y: todo.completed ? -2 : 0)
            .onTapGesture {
                viewModel.updateTodoStatus(todo)
            }
            .disabled(disabled)
    }
    
}

#Preview {
    let todo = TodoEntity(context: TLPersistenceMananger.shared.container.viewContext)
    todo.title = "Meet Chara"
    todo.note = "Do not forget to bring her book I borrowed"
    todo.date = Date()
    
    return TLTodoStatusView(todo: todo)
}
