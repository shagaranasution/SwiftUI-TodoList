//
//  ContentView.swift
//  TodoList
//
//  Created by Shagara F Nasution on 22/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel: TLTodoViewModel = TLTodoViewModel()
    
//    let todo: TodoEntity = {
//        let todo = TodoEntity(context: TLPersistenceMananger.shared.container.viewContext)
//        todo.id = UUID().uuidString
//        todo.title = "Going to market"
//        todo.note = "Buy apple, grapes, milk, cola, eggs, shoap, shampoo, snacks, chocolate, air minerals, meat, palm oils, bread"
//        todo.date = Date()
//        
//        return todo
//    }()
    
    var body: some View {
        NavigationView {
            TLTodoListView()
        }
        .environmentObject(viewModel)
//        TLTodoPreviewView(
//            showed: .constant(true),
//            todo: .constant(todo)
//        )
    }
}

#Preview {
    ContentView()
}
