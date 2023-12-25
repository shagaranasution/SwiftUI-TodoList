//
//  TLTodoTextFieldView.swift
//  TodoList
//
//  Created by Shagara F Nasution on 22/12/23.
//

import SwiftUI

public struct TLTodoTextFieldView: View {
    
    @State private var textFieldText = ""
    
    public var body: some View {
        TextField("Enter task..", text: $textFieldText)
            .padding(.horizontal)
            .frame(height: 55)
            .background(Color(UIColor.tertiarySystemBackground))
            .cornerRadius(10)
    }
    
}

#Preview {
    TLTodoTextFieldView()
}
