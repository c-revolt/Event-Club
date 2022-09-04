//
//  CoreDataManager.swift
//  Event Club
//
//  Created by Александр Прайд on 14.08.2022.
//

import CoreData
import UIKit

final class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    lazy var persistantContainer: NSPersistentContainer = {
        let persistentContaier = NSPersistentContainer(name: "Event Club")
        persistentContaier.loadPersistentStores { _, error in
            print(error?.localizedDescription ?? "")
        }
        return persistentContaier
    }()
    
    var moc: NSManagedObjectContext {
        persistantContainer.viewContext
    }
    
    func getEvent(_ id: NSManagedObjectID) -> Event? {
        do {
            return try moc.existingObject(with: id) as? Event
        } catch {
            print(error)
        }
        
        return nil
    }
    
    func saveEvent(name: String, date: Date, image: UIImage) {
        let event = Event(context: moc)
        event.setValue(name, forKey: "name")
        
        let resizedImage = image.sameAspectRation(newHeight: 250)
        // уменьшаем качество сжатия
        let imageData = resizedImage.jpegData(compressionQuality: 0.5)
        event.setValue(imageData, forKey: "image")
        
        event.setValue(date, forKey: "date")
        
        do {
            try moc.save()
        } catch {
            print(error)
        }
    }
    
    func fetchEvents() -> [Event] {
        do {
            let fetchRequest = NSFetchRequest<Event>(entityName: "Event")
            let events = try moc.fetch(fetchRequest)
            return events
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
