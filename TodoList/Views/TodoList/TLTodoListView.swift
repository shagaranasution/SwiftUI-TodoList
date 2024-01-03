//
//  TLTodoListView.swift
//  TodoList
//
//  Created by Shagara F Nasution on 22/12/23.
//

import SwiftUI

public struct TLTodoListView: View {
    
    @EnvironmentObject var viewModel: TLTodoViewModel
    @State private var showedSheet = false
    @State private var todoToPreview: TodoEntity? = nil
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8)
    ]
    
    public var body: some View {
        ZStack(alignment: .center) {
            ScrollView {
                if !viewModel.todos.isEmpty {
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(viewModel.todos) { todo in
                            TLTodoItemView(todo: todo)
                                .onTapGesture {
                                    todoToPreview = todo
                                }
                        }
                    }
                    .padding(.horizontal)
                } else {
                    TLNoTodosView(showedCreationSheet: $showedSheet)
                        .offset(y: UIScreen.main.bounds.height * 0.3)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay {
                if showedSheet {
                    TLSheet(isShow: $showedSheet) {
                        TLTodoCreationView(
                            showed: $showedSheet
                        )
                    }
                    .ignoresSafeArea(.keyboard)
                }
                else if todoToPreview != nil {
                    TLTodoPreviewView(
                        todo: $todoToPreview
                    )
                }
            }
        }
        .navigationTitle("Todos")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showedSheet.toggle()
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(Color.primary)
                }
                
            }
        }
        .navigationBarHidden(showedSheet || (todoToPreview != nil))
    }
    
}

#Preview {
    NavigationView {
        TLTodoListView()
            .environmentObject(
                TLTodoViewModel())
    }
}
