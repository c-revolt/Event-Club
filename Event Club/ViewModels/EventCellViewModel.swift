//
//  EventCellViewModel.swift
//  Event Club
//
//  Created by Александр Прайд on 28.08.2022.
//

import UIKit
import CoreData

struct EventCellViewModel {
    
    let date = Date()
    private static let imageCache = NSCache<NSString, UIImage>()
    private let imageQueue = DispatchQueue(label: "imageDispatch", qos: .background)
    var onSelect: (NSManagedObjectID) -> Void = { _ in }
    
    private var cacheKey: String {
        event.objectID.description
    }
    
    var timeRemainingStrings: [String] {
        guard let eventDate = event.date else { return [] }
        return date.timeRemaining(until: eventDate)?.components(separatedBy: ",") ?? []
    }
    
    var dateText: String? {
        guard let eventDate = event.date else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyy"
        return dateFormatter.string(from: eventDate)
    }
    
    var eventName: String? {
        event.name
    }
    
    var timeRemainingViewModel: TimeRemainingViewModel? {
        
        guard let eventDate = event.date,
              let timeRemainingParts = date.timeRemaining(until: eventDate)?.components(separatedBy: ",") else { return nil }
        return TimeRemainingViewModel(timeRemainingParts: timeRemainingParts, mode: .cell)
    }
    
    func loadImage(complition: @escaping(UIImage?) -> Void) {
        if let image = Self.imageCache.object(forKey: cacheKey as NSString) {
            complition(image)
        } else {
            imageQueue.async {
                
                guard let imageData = self.event.image,
                      let image = UIImage(data: imageData) else {
                    complition(nil)
                    return
                }
                Self.imageCache.setObject(image, forKey: self.cacheKey as NSString)
                DispatchQueue.main.async {
                    complition(image)
                }
            }
        }
    }
    
    func didSelect() {
        onSelect(event.objectID)
    }
    
    private let event: Event
    
    init(_ event: Event) {
        self.event = event
    }
}
