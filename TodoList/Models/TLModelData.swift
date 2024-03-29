//
//  TLModelData.swift
//  TodoList
//
//  Created by Shagara F Nasution on 25/12/23.
//

import Foundation

public var mockTodo: TLTodoItem = TLTodoItem(
    title: "Going to market",
    note: nil,
    date: Date(),
    completed: true,
    archived: false
)

public var mockTodos: [TLTodoItem] = [
    TLTodoItem(
        title: "Going to market",
        note: nil,
        date: Date(),
        completed: true,
        archived: false),
    
    TLTodoItem(
        title: "Meet Chara",
        note: "Do not forget to bring book",
        date: Date(timeIntervalSinceNow: TimeInterval(60 * 60 * 5)),
        completed: false,
        archived: false),
    
    TLTodoItem(
        title: "Going to market",
        note: nil,
        date: Date(),
        completed: true,
        archived: false),
    
    TLTodoItem(
        title: "Title that have more words",
        note: "This description has one, two, tree, four, five, sixx, sevenm eight, nine, ten, eleven, twelv...e, many many words.",
        date: Date(timeIntervalSinceNow: TimeInterval(60 * 60 * 5)),
        completed: false,
        archived: false),
    
]

