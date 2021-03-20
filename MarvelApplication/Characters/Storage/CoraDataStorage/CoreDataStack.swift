//
//  CoreDataStack.swift
//  Characters
//
//  Created by Carlos Fontes on 18/03/21.
//

import Foundation
import CoreData

public final class CoreDataStack {
    
    private init(){}
    
    public static var shared = CoreDataStack()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataStorage")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
            

        })
        
        return container
    }()
    
    public lazy var viewContext : NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()

    func saveContext () {
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
    
    // MARK: - Test mockups
    public lazy var mockPersistantContainer: NSPersistentContainer = {
        let persistentStoreDescription = NSPersistentStoreDescription()
        persistentStoreDescription.type = NSInMemoryStoreType

        let container = NSPersistentContainer(name: "CoreDataStorage")
        container.persistentStoreDescriptions = [persistentStoreDescription]

        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Chama erro no coredata do test (error.userInfo)")
            }
        }
        

        return container
    }()

}
