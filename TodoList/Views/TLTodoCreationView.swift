//
//  TLTodoCreationView.swift
//  TodoList
//
//  Created by Shagara F Nasution on 22/12/23.
//

import SwiftUI

public struct TLTodoCreationView: View {
    
    public var body: some View {
//        ScrollView {
            VStack {
                TLTodoTextFieldView()
                
                Spacer()
                
                Button {
                    //
                } label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .tint(Color.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .clipShape(.rect(cornerRadius: 10))
                }
            }
            .padding()
//        }
        .navigationTitle("Create a Task")
    }
    
}

#Preview {
    NavigationView {
        TLTodoCreationView()
    }
}
