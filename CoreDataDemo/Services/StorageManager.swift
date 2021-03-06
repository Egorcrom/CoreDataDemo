//
//  StorageManager.swift
//  CoreDataDemo
//
//  Created by Егор Кромин on 08.12.2021.
//

import Foundation
import CoreData

class StorageManager {
    static let shared = StorageManager()

    var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "CoreDataDemo")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    })
    return container
}()

func saveContext() {
    let context = persistentContainer.viewContext
    if context.hasChanges {
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
    func delete(_ task: Task){
        persistentContainer.viewContext.delete(task)
    }
    
}
