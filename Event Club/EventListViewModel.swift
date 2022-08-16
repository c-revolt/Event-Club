//
//  EventListViewModel.swift
//  Event Club
//
//  Created by Александр Прайд on 16.08.2022.
//

import Foundation

final class EventListViewModel {
    
    let title = "Events"
    var coordinator: EventListCoordinator?
    
    func tappedAddEvent() {
        coordinator?.startAddEvent()
    }
}
