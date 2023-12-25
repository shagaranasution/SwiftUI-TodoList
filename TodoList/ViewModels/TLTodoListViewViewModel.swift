//
//  TLTodoListViewViewModel.swift
//  TodoList
//
//  Created by Shagara F Nasution on 25/12/23.
//

import Foundation

public class TLTodoListViewViewModel: ObservableObject {
 
    @Published public var todos: [TLTodoItem] = []
    
    init() {
        getTodos()
    }
    
    public func getTodos() {
        self.todos.append(contentsOf: mockTodos)
    }
    
    public func updateTodoStatus(_ todo: TLTodoItem) {
        guard let index = todos.firstIndex(where: { $0.id == todo.id }) else {
            return
        }
        
        todos[index].completed.toggle()
    }
    
}
