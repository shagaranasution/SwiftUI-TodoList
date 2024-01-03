//
//  TLNoTodosView.swift
//  TodoList
//
//  Created by Shagara F Nasution on 28/12/23.
//

import SwiftUI

struct TLNoTodosView: View {
    
    @Binding var showedCreationSheet: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            Text("There is no todo, yet.")
                .font(.title2)
            
            Button {
                showedCreationSheet.toggle()
            } label: {
                Text("Try to create one?")
                    .font(.headline)
                    .foregroundStyle(Color.teal)
            }
        }
        .multilineTextAlignment(.center)
        .frame(maxWidth: 220)
    }
    
}

#Preview {
    TLNoTodosView(showedCreationSheet: .constant(false))
}
