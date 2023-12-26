//
//  TLTodoItem.swift
//  TodoList
//
//  Created by Shagara F Nasution on 23/12/23.
//

import Foundation

public struct TLTodoItem: Identifiable, Equatable {
    public let id: String = UUID().uuidString
    var title: String
    var note: String?
    var dueDate: Date
    var completed: Bool
    var archived: Bool
}

