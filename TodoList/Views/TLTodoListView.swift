//
//  TLTodoListView.swift
//  TodoList
//
//  Created by Shagara F Nasution on 22/12/23.
//

import SwiftUI

public struct TLTodoListView: View {
    
    @StateObject private var viewModel: TLTodoListViewViewModel = TLTodoListViewViewModel()
    @State private var sheetShowed = false
    
    
    let rows: [GridItem] = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8)
    ]
    
    public var body: some View {
        ScrollView {
            LazyVGrid(columns: rows, spacing: 8) {
                ForEach(viewModel.todos) { todo in
                    TLTodoItemView(todo: todo)
                        .onTapGesture {
                            viewModel.updateTodoStatus(todo)
                        }
                }
            }
            .padding(.horizontal)
            .navigationTitle("Todo List")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        sheetShowed.toggle()
                    } label: {
                        Text("Add")
                    }

                }
            }
        }
        .sheet(isPresented: $sheetShowed) {
            TLTodoCreationView()
        }
    }
    
}

#Preview {
    NavigationView {
        TLTodoListView()
    }
}
