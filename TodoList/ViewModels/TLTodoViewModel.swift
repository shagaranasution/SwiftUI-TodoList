//
//  TLTodoViewModel.swift
//  TodoList
//
//  Created by Shagara F Nasution on 25/12/23.
//

import Foundation
import CoreData

public final class TLTodoViewModel: ObservableObject {
 
    @Published var todos: [TodoEntity] = []
    
    private var storeContainer: NSPersistentContainer {
        return TLPersistenceMananger.shared.container
    }
    
    init() {
        fetchTodos()
    }
    
    private func fetchTodos() {
        do {
            let request: NSFetchRequest<TodoEntity> = TodoEntity.fetchRequest()
            let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
            request.sortDescriptors = [sortDescriptor]
            todos = try storeContainer.viewContext.fetch(request)
        } catch {
            print("Error fetching todos: \(error)")
        }
    }
    
    private func saveData() {
        do {
            try storeContainer.viewContext.save()
            fetchTodos()
        } catch {
            print("Error saving data: \(error)")
        }
    }
    
    public func updateTodoStatus(_ todo: TodoEntity) {
        todo.completed.toggle()
        saveData()
    }
    
    public func addTodo(
        withTitle title: String,
        note: String? = nil,
        date: Date
    ) {
        let newTodo = TodoEntity(context: storeContainer.viewContext)
        newTodo.id = UUID().uuidString
        newTodo.title = title
        newTodo.note = note
        newTodo.date = date
        newTodo.completed = false
        newTodo.archived = false

        saveData()
    }
    
}
