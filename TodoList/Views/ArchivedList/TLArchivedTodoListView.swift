//
//  TLArchivedTodoListView.swift
//  TodoList
//
//  Created by Shagara F Nasution on 08/01/24.
//

import SwiftUI

public struct TLArchivedTodoListView: View {
    
    @EnvironmentObject var viewModel: TLTodoViewModel
    
    private var archivedTodos: [TodoEntity] {
        viewModel.todos.filter { $0.archived }
    }
    
    public var body: some View {
        ScrollView {
            if !archivedTodos.isEmpty {
                ForEach(archivedTodos, id: \.id) { todo in
                    ZStack {
                        TLArchivedTodoItemView(todo: todo)
                    }
                    .padding(.horizontal)
                }
            } else {
                TLNoArchivedTodosView()
                    .offset(y: UIScreen.main.bounds.height * 0.4)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

#Preview {
   TLArchivedTodoListView()
        .environmentObject(TLTodoViewModel())
}
