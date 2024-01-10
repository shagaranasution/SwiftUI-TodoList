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
    
    private var unarchivedTodos: [TodoEntity] {
        viewModel.todos.filter { !$0.archived }
    }
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8)
    ]
    
    public var body: some View {
        ZStack(alignment: .center) {
            ScrollView {
                if !unarchivedTodos.isEmpty {
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(unarchivedTodos, id: \.id) { todo in
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
                    .transition(AnyTransition.opacity.animation(.easeIn))
                }
            }
        }
        .navigationTitle("Todos")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                HStack(spacing: 0) {
                    NavigationLink {
                        TLArchivedTodoListView()
                    } label: {
                        Image(systemName: "archivebox.fill")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(Color.primary)
                    }
                    Button {
                        showedSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(Color.primary)
                    }
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
