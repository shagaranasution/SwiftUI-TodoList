//
//  TLTodoViewModel.swift
//  TodoList
//
//  Created by Shagara F Nasution on 25/12/23.
//

import Foundation
import CoreData
import Combine

public final class TLTodoViewModel: ObservableObject {
 
    @Published var todos: [TodoEntity] = [] 
    
    var cancellables = Set<AnyCancellable>()
    
    private var storeContainer: NSPersistentContainer {
        return TLPersistenceMananger.shared.container
    }
    
    // MARK: - Initialization
    
    init() {
        fetchTodos()
    }
    
    // MARK: - Private Methods
    
    private func fetchTodos() {
        do {
            let request: NSFetchRequest<TodoEntity> = TodoEntity.fetchRequest()
            let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
            
            request.sortDescriptors = [sortDescriptor]
            request.returnsObjectsAsFaults = false
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
    
    private func getTodoIndex(_ todo: TodoEntity) -> Int? {
        guard
            let index = todos.firstIndex(where: { $0.id == todo.id })
        else { return nil }
        
        return index
    }
    
    // MARK: - Public Methods
    
    public func addTodo(
        withTitle title: String,
        note: String,
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
    
    public func updateTodo(
        _ todo: TodoEntity,
        withNewTitle title: String,
        note: String,
        date: Date
    ) {
        guard
            let index = getTodoIndex(todo)
        else { return  }
        
        todos[index].title = title
        todos[index].note = note
        todos[index].date = date
        
        saveData()
    }
    
    public func updateTodoStatus(_ todo: TodoEntity) {
        guard
            let index = getTodoIndex(todo)
        else { return  }
        
        todos[index].completed.toggle()
        
        saveData()
    }
    
    public func archiveTodo(_ todo: TodoEntity) {
        guard
            let index = getTodoIndex(todo)
        else { return  }
        
        todos[index].archived = true
        
        saveData()
    }
    
    public func unarchiveTodo(_ todo: TodoEntity) {
        guard
            let index = todos.firstIndex(of: todo)
        else { return }
        
        todos[index].archived = false
        
        saveData()
    }
    
    public func deleteTodo(_ todo: TodoEntity) {
        guard
            let index = todos.firstIndex(of: todo)
        else { return }
        let todoToRemove = todos[index]
        storeContainer.viewContext.delete(todoToRemove)
        
        saveData()
    }
    
}
