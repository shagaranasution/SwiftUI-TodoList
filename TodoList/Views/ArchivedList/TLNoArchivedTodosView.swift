//
//  TLNoArchivedTodosView.swift
//  TodoList
//
//  Created by Shagara F Nasution on 08/01/24.
//

import SwiftUI

public struct TLNoArchivedTodosView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    public var body: some View {
        VStack(spacing: 8) {
            Text("There is no archived.")
                .font(.title2)
            
            Button {
                dismiss()
            } label: {
                Text("See todo available")
                    .font(.headline)
                    .foregroundStyle(Color.teal)
            }
        }
        .multilineTextAlignment(.center)
        .frame(maxWidth: 220)
    }
    
}
