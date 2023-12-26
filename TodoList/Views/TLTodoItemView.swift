//
//  TLTodoItemView.swift
//  TodoList
//
//  Created by Shagara F Nasution on 23/12/23.
//

import SwiftUI

public struct TLTodoItemView: View {
    
    public var todo: TLTodoItem
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment:.top, spacing: 4) {
                Text(todo.dueDate, format: .dateTime.day())
                    .font(.system(size: 50, weight: .semibold))
                    .padding(.top, -8)
                VStack(spacing: 2) {
                    Text(todo.dueDate, format: .dateTime.month())
                        .fontWeight(.semibold)
                    Text(todo.dueDate, format: .dateTime.weekday(.abbreviated))
                        .fontWeight(.semibold)
                }
                Spacer(minLength: 2)
                TLTodoStatusView(completed: todo.completed)
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
                        .lineLimit(2)
                }
            }
            Spacer(minLength: 8)
            HStack(spacing: 4){
                Text("at")
                Text(todo.dueDate, format: .dateTime.hour().minute())
                    .fontWeight(.semibold)
            }
        }
        .padding()
        .background(Color.teal)
        .clipShape(.rect(cornerRadius: 10))
    }
    
}

#Preview {
    let item = TLTodoItem(
        title: "Going to market", 
        note: nil,
        dueDate: Date(),
        completed: true,
        archived: false)
    let item2 = TLTodoItem(
        title: "Meet Chara",
        note: "Do not forget to bring book she want to borrow",
        dueDate: Date(timeIntervalSinceNow: TimeInterval(60 * 60 * 5)),
        completed: false,
        archived: false)
    
    return Group {
        TLTodoItemView(todo: item)
        TLTodoItemView(todo: item2)
    }
}
