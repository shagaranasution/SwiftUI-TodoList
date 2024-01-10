//
//  ContentView.swift
//  TodoList
//
//  Created by Shagara F Nasution on 22/12/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            TLTodoListView()
        }
        .tint(Color.primary)
    }
}

#Preview {
    ContentView()
        .environmentObject(TLTodoViewModel())
}
