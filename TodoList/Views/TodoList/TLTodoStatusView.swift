//
//  TLTodoStatusView.swift
//  TodoList
//
//  Created by Shagara F Nasution on 25/12/23.
//

import SwiftUI

public struct TLTodoStatusView: View {
    
    @Binding public var completed: Bool
    
    public var body: some View {
        let imageName: String = completed ? "checkmark.seal.fill" : "circle.fill"
        let width: CGFloat = completed ? 28 : 24
        let height: CGFloat = width
        
        return Image(systemName: imageName)
            .resizable()
            .frame(width: width)
            .frame(height: height)
            .offset(x: completed ? 2 : 0)
            .offset(y: completed ? -2 : 0)
    }
    
}

#Preview {
    TLTodoStatusView(completed: .constant(true))
}
