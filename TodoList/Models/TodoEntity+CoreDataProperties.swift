//
//  TodoEntity+CoreDataProperties.swift
//  TodoList
//
//  Created by Shagara F Nasution on 28/12/23.
//
//

import Foundation
import CoreData


extension TodoEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoEntity> {
        return NSFetchRequest<TodoEntity>(entityName: "TodoEntity")
    }

    @NSManaged public var archived: Bool
    @NSManaged public var completed: Bool
    @NSManaged public var date: Date
    @NSManaged public var id: String
    @NSManaged public var note: String?
    @NSManaged public var title: String

}

extension TodoEntity : Identifiable {

}
