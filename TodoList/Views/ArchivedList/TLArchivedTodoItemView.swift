//
//  TLArchivedTodoItemView.swift
//  TodoList
//
//  Created by Shagara F Nasution on 08/01/24.
//

import SwiftUI

public struct TLArchivedTodoItemView: View {
    
    @EnvironmentObject private var viewModel: TLTodoViewModel
    
    public var todo: TodoEntity
    
    public var body: some View {
        if !todo.id.isEmpty {
            HStack {
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        TLTodoStatusView(
                            todo: todo,
                            disabled: true
                        )
                        Text(todo.title)
                            .font(.headline)
                            .lineLimit(1)
                            .padding(.top, -4)
                    }
                    Text(todo.date, format: .dateTime.day().month().year())
                }
                Spacer()
                HStack(spacing: 8) {
                    Button {
                        viewModel.deleteTodo(todo)
                    } label: {
                        Image(systemName: "trash.fill")
                            .font(.system(size: 20, weight: .semibold))
                            .tint(Color(UIColor.systemPink))
                    }
                    
                    Button {
                        viewModel.unarchiveTodo(todo)
                    } label: {
                        Image(systemName: "arrowshape.turn.up.backward.fill")
                            .font(.system(size: 20, weight: .semibold))
                            .tint(Color.primary)
                    }
                }
            }
            .padding()
            .background(Color.teal)
            .clipShape(.rect(cornerRadius: 10))
        } else {
            EmptyView()
        }
    }
    
}

#Preview {
    let todo = TodoEntity(context: TLPersistenceMananger.shared.container.viewContext)
    todo.id = UUID().uuidString
    todo.title = "Going to market"
    todo.note = "Buy apple, grapes, milk, cola, eggs, shoap, shampoo, snacks, chocolate, air minerals, meat, palm oils, bread"
    todo.date = Date()
    todo.completed = true
    todo.archived = true
    
    return TLArchivedTodoItemView(
        todo: todo
    )
}
