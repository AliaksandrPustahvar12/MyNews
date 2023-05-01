//
//  DataBaseService.swift
//  MyNews
//
//  Created by Aliaksandr Pustahvar on 29.04.23.
//

import Foundation
import CoreData

final class DataBaseService: ObservableObject {
    
    static let shared = DataBaseService()
    
    let context: NSManagedObjectContext
    
    init() {
        let container = NSPersistentContainer(name: "MyNews")
        container.loadPersistentStores { _, error in
            if let error {
                print("Непредвиденная ошибка базы данных: \(error.localizedDescription)")
            }
        }
        context = container.viewContext
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            print("Saving error")
        }
    }
}
