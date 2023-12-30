//
//  TLPersistenceMananger.swift
//  TodoList
//
//  Created by Shagara F Nasution on 28/12/23.
//

import CoreData

final class TLPersistenceMananger {
    
    static let shared = TLPersistenceMananger()
    
    let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "MainContainer")
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                print("Error loading core data: \(error)")
            } else {
                print("Successfully loaded core data.")
            }
        }
    }
    
}
