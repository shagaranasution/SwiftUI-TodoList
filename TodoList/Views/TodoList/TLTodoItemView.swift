//
//  TLTodoItemView.swift
//  TodoList
//
//  Created by Shagara F Nasution on 23/12/23.
//

import SwiftUI

public struct TLTodoItemView: View {
    
    @Binding public var todo: TodoEntity
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment:.top, spacing: 4) {
                Text(todo.date, format: .dateTime.day())
                    .font(.system(size: 44, weight: .semibold))
                    .padding(.top, -8)
                VStack(alignment: .leading, spacing: 0) {
                    Text(todo.date, format: .dateTime.month())
                        .fontWeight(.semibold)
                    Text(todo.date, format: .dateTime.weekday(.abbreviated))
                        .fontWeight(.semibold)
                }
                .padding(.top, -2)
                Spacer(minLength: 2)
                TLTodoStatusView(completed: $todo.completed)
            }
            VStack(alignment: .leading) {
                Text(todo.title)
                    .font(.headline)
                    .fontWeight(.regular)
                    .lineLimit(2)
                
                if let description = todo.note {
                    Text(description)
                        .font(.caption)
                        .fontWeight(.light)
                        .lineLimit(3)
                }
            }
            Spacer(minLength: 8)
            HStack(spacing: 4){
                Text("at")
                Text(todo.date, format: .dateTime.hour().minute())
                    .fontWeight(.semibold)
            }
        }
        .padding()
        .background(Color.teal)
        .clipShape(.rect(cornerRadius: 10))
    }
    
}

#Preview {
    let todo = TodoEntity(context: TLPersistenceMananger.shared.container.viewContext)
    todo.title = "Meet Chara"
    todo.note = "Do not forget to bring her book I borrowed"
    todo.date = Date()
    
    return Group {
        TLTodoItemView(todo: .constant(todo))
        TLTodoItemView(todo: .constant(todo))
    }
}
