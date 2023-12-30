//
//  Extensions.swift
//  TodoList
//
//  Created by Shagara F Nasution on 26/12/23.
//

import SwiftUI

extension View {
    public func cornerRadius(
        _ radius: CGFloat,
        corners: UIRectCorner) -> some View {
        clipShape(
            RoundedCorner(
                radius: radius,
                corners: corners
            ))
    }
    
    public func transparentScrolling() -> some View {
        if #available(iOS 16.0, *) {
            return scrollContentBackground(.hidden)
        } else {
            return onAppear {
                UITextView.appearance().backgroundColor = .clear
            }
        }
    }
}
