//
//  CoreDataStack.swift
//  LoveMyPet
//
//  Created by userext on 21/07/23.
//
import Foundation
import CoreData

struct CoreDataStack {
    static let shared = CoreDataStack()
    let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    func saveData() {
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
    init(inMemory: Bool = false) {
        persistentContainer = NSPersistentContainer(name: "PetModel")
        if inMemory {
            persistentContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        persistentContainer.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                print("CoreDataStack Error - Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    func saveContext() -> Bool {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                return true
            } catch {
                let nsError = error as NSError
                return false
            }
        } else {
            return false
        }
    }
}
