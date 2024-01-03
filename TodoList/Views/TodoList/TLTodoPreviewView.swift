//
//  TLTodoPreviewView.swift
//  TodoList
//
//  Created by Shagara F Nasution on 01/01/24.
//

import SwiftUI

struct TLTodoPreviewView: View {
    
    @EnvironmentObject private var viewModel: TLTodoViewModel
    @Binding public var todo: TodoEntity?
    @State private var showedTodoCreationSheet: Bool = false
    
    var body: some View {
        if let safeTodo = todo {
            ZStack(alignment: .bottom) {
                // background
                Rectangle()
                    .fill(.thinMaterial)
                    .ignoresSafeArea()
                    .onTapGesture {
                        todo = nil
                    }
                
                // foreground
                VStack(spacing: 36) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(safeTodo.date,
                                 format: .dateTime
                                .weekday(.wide)
                                .day()
                                .month()
                                .year()
                                .hour()
                                .minute())
                            Text(safeTodo.title)
                                .font(.title3)
                                .fontWeight(.semibold)
                        }
                        Spacer()
                        TLTodoStatusView(todo: safeTodo)
                    }
                    if let note = safeTodo.note,
                        !note.isEmpty {
                        Text(note)
                            .multilineTextAlignment(.center)
                    }
                    Button {
                        showedTodoCreationSheet = true
                    } label: {
                        Text("Edit Todo")
                            .font(.headline)
                            .foregroundStyle(Color.primary)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 32)
                            .overlay {
                                Capsule(style: .circular)
                                    .stroke(Color.primary, lineWidth: 1)
                            }
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.teal)
                .clipShape(.rect(cornerRadius: 10))
                .padding(8)
                
            }
            .frame(maxWidth: UIScreen.main.bounds.width)
            .frame(maxHeight: UIScreen.main.bounds.height)
            .zIndex(2)
            .overlay {
                if showedTodoCreationSheet {
                    TLSheet(isShow: $showedTodoCreationSheet) {
                        TLTodoCreationView(
                            todo: safeTodo,
                            showed: $showedTodoCreationSheet
                        )
                    }
                    .ignoresSafeArea(.keyboard)
                }
            }
        }
        else {
            EmptyView()
        }
        
    }
    
}

#Preview {
    let todo = TodoEntity(context: TLPersistenceMananger.shared.container.viewContext)
    todo.id = UUID().uuidString
    todo.title = "Going to market"
    todo.note = "Buy apple, grapes, milk, cola, eggs, shoap, shampoo, snacks, chocolate, air minerals, meat, palm oils, bread"
    todo.date = Date()
    
    return TLTodoPreviewView(
        todo: .constant(todo)
    )
    .environmentObject(TLTodoViewModel())
}
