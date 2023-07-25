//
//  CoreDataStack.swift
//  LoveMyPet
//
//  Created by userext on 21/07/23.
//
import Foundation
import CoreData

enum StorageType {
    case persistent, inMemory
}

class CoreDataStack {
    public static let shared = CoreDataStack(.persistent)
    public static let inMemory = CoreDataStack(.inMemory)
    private static let modelName: String = "LoveMyPet"
    private var persistentContainer: NSPersistentContainer
    
    init(_ storageType: StorageType = .persistent) {
        self.persistentContainer = NSPersistentContainer(name: CoreDataStack.modelName)
        if storageType == .inMemory {
            let description = NSPersistentStoreDescription()
            description.type = NSInMemoryStoreType
            self.persistentContainer.persistentStoreDescriptions = [description]
        }
        self.persistentContainer.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                print("CoreDataStack Error - Unresolved error \(error), \(error.userInfo)")
            }
        }
        var context: NSManagedObjectContext = {
            return self.persistentContainer.viewContext
        }()
        func save() {
            let context = persistentContainer.viewContext
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror)")
                }
            }
        }
    }
}
