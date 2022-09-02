//
//  EventCellViewModel.swift
//  Event Club
//
//  Created by Александр Прайд on 28.08.2022.
//

import UIKit

struct EventCellViewModel {
    
    let date = Date()
    
    var timeRemainingStrings: [String] {
        guard let eventDate = event.date else { return [] }
        return date.timeRemaining(until: eventDate)?.components(separatedBy: ",") ?? []
    }
    
    var dateText: String {
        "25 Mar 2020"
    }
    
    var eventName: String {
        "Barbados"
    }
    
    var backgroundImage: UIImage {
        #imageLiteral(resourceName: "testImage")
    }
    
    private let event: Event
    
    init(_ event: Event) {
        self.event = event
    }
}
