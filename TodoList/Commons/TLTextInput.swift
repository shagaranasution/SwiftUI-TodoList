//
//  TLTextInput.swift
//  TodoList
//
//  Created by Shagara F Nasution on 22/12/23.
//

import SwiftUI

public struct TLTextInput: View {
    
    public var label: String?
    public let placeholder: String
    public var variant: Variant?
    
    @Binding public var text: String
    
    public enum Variant {
        case textField
        case textEditor
    }
    
    init(
        _ placeholder: String,
        text: Binding<String>,
        label: String? = nil,
        variant: Variant? = .textField
    ) {
        self.label = label
        self.placeholder = placeholder
        self._text = text
        self.variant = variant
    }
    
    public var body: some View {
        
        VStack(alignment: .leading, spacing: 4) {
            if let label = label {
                Text(label)
                    .font(.title3)
            }
            
            switch variant {
            case .textField:
                TextField(placeholder, text: $text)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(UIColor.tertiarySystemBackground))
                    .cornerRadius(10)
            case .textEditor:
                ZStack(alignment: .topLeading) {
                    if text.isEmpty {
                        Text(placeholder)
                            .font(.body)
                            .foregroundStyle(Color(UIColor.tertiaryLabel))
                            .padding(.top)
                            .animation(nil, value: text)
                    }
                    TextEditor(text: $text)
                        .font(.body)
                        .padding(.horizontal, -4)
                        .padding(.top, 8)
                }
                .padding(.horizontal)
                .frame(height: 76)
                .transparentScrolling()
                .background(Color(UIColor.tertiarySystemBackground))
                .cornerRadius(10)
            default:
                EmptyView()
            }
        }
    }
    
}

#Preview {
    Group {
        TLTextInput(
            "Writing a journal",
            text: .constant(""),
            label: "Task"
        )
        
        TLTextInput(
            "(Optional) Making journal containing 200 words at least",
            text: .constant(""),
            label: "Detail",
            variant: .textEditor
        )
    }
}
