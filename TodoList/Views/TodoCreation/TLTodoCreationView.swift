//
//  TLTodoCreationView.swift
//  TodoList
//
//  Created by Shagara F Nasution on 22/12/23.
//

import SwiftUI

public struct TLTodoCreationView: View {
    
    public var todo: TodoEntity? = nil
    
    @EnvironmentObject var viewModel: TLTodoViewModel
    
    @Binding var showed: Bool
    
    @State private var title = ""
    @State private var note = ""
    @State private var date = Date()
    
    var isSaveDisable: Bool {
        !viewModel.validateInput(ofText: title)
    }
    
    private let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startDate = Date.now
        let endDate = calendar.date(
            byAdding: .year,
            value: 10,
            to: startDate
        ) ?? startDate
        
        return startDate...endDate
    }()
    
    public var body: some View {
        VStack(spacing: 16) {
            TLTextInput(
                "Writing journal",
                text: $title,
                label: "Task"
            )
            
            TLTextInput(
                "(Optional) Write at least 200 words of journal",
                text: $note,
                label: "Note",
                variant: .textEditor
            )
            
            DatePicker(
                selection: $date,
                in: dateRange
            ) {
                Text("Date")
                    .font(.title3)
            }
            .tint(Color.primary)
            .padding(.vertical, 8)
            
            Spacer()
            
            Button {
                if let todo = todo {
                    viewModel.updateTodo(
                        todo,
                        withNewTitle: title,
                        note: note,
                        date: date)
                } else {
                    viewModel.addTodo(
                        withTitle: title,
                        note: note,
                        date: date
                    )
                }
                showed.toggle()
            } label: {
                Text("Save".uppercased())
                    .font(.headline)
                    .tint(Color.primary)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(isSaveDisable ?
                                Color(UIColor.systemGray5): Color.teal)
                    .clipShape(.rect(cornerRadius: 10))
            }
            .disabled(isSaveDisable)
        }
        .onAppear {
            if let todo = todo {
                title = todo.title
                note = todo.note ?? ""
                date = todo.date
            }
        }
    }
    
}

#Preview {
    NavigationView {
        TLTodoCreationView(
            showed: .constant(true)
        )
        .background(Color(UIColor.secondarySystemBackground))
        .environmentObject(TLTodoViewModel())
    }
}
