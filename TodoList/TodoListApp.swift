//
//  TodoListApp.swift
//  TodoList
//
//  Created by Shagara F Nasution on 22/12/23.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject private var viewModel: TLTodoViewModel = TLTodoViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
