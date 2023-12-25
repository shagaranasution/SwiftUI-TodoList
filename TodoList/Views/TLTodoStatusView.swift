//
//  TLTodoStatusView.swift
//  TodoList
//
//  Created by Shagara F Nasution on 25/12/23.
//

import SwiftUI

public struct TLTodoStatusView: View {
    
    public var completed: Bool
    
    public var body: some View {
        let imageName: String = completed ? "checkmark.seal.fill" : "circle.fill"
        let width: CGFloat = completed ? 28 : 24
        let height: CGFloat = width
        
        return Image(systemName: imageName)
            .resizable()
            .frame(width: width)
            .frame(height: height)
            .animation(completed ? .bouncy : nil, value: completed)
    }
    
}

#Preview {
    TLTodoStatusView(completed: true)
}
