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


//class CoreDataStack {
//    static let shared = CoreDataStack()
//
//    let container: NSPersistentContainer
//
//    private init() {
//        container = NSPersistentContainer(name: "LoveMyPet") // Nome do seu modelo
//        container.loadPersistentStores(completionHandler: { _, error in
//            if let error = error as NSError? {
//                fatalError("Falha ao carregar o armazenamento persistente: \(error.localizedDescription)")
//            }
//        })
//    }
//
//    static var preview: CoreDataStack = {
//        let result = CoreDataStack()
//        let viewContext = result.persistentContainer.viewContext
//        // Configurações de pré-visualização, se necessário
//        return result
//    }()
//}



class CoreDataStack {
    static let shared = CoreDataStack()
    
    private let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "Model") // Nome do seu modelo
        persistentContainer.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Não deu certo por que deu: \(error)")
            }
        }
        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
    }
}

//class CoreDataStack {
//    public static let shared = CoreDataStack(.persistent)
//    public static let inMemory = CoreDataStack(.inMemory)
//    private static let modelName: String = "LoveMyPet"
//    var persistentContainer: NSPersistentContainer
//    init(_ storageType: StorageType = .persistent) {
//        self.persistentContainer = NSPersistentContainer(name: CoreDataStack.modelName)
//        if storageType == .inMemory {
//            let description = NSPersistentStoreDescription()
//            description.type = NSInMemoryStoreType
//            self.persistentContainer.persistentStoreDescriptions = [description]
//        }
//        self.persistentContainer.loadPersistentStores { (storeDescription, error) in
//            if let error = error as NSError? {
//                print("CoreDataStack Error - Unresolved error \(error), \(error.userInfo)")
//            }
//        }
//        var viewContext: NSManagedObjectContext = {
//            persistentContainer.viewContext
//        }()
//        func save() {
//            let context = persistentContainer.viewContext
//            if context.hasChanges {
//                do {
//                    try context.save()
//                } catch {
//                    let nserror = error as NSError
//                    fatalError("Unresolved error \(nserror)")
//                }
//            }
//        }
//    }
//}
