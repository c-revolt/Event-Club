//
//  EventDetailCoordinator.swift
//  Event Club
//
//  Created by Александр Прайд on 04.09.2022.
//

import UIKit
import CoreData

final class EventDetailCoordinator: Coordinator {
    
    let childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    private let eventID: NSManagedObjectID
    var parentCoordinator: EventListCoordinator?
    
    
    init(eventID: NSManagedObjectID, navigationController: UINavigationController) {
        self.eventID = eventID
        self.navigationController = navigationController
    }
    
    func start() {
        let detailViewController = EventDetailViewController()
        let eventDetailViewModel = EventDetailViewModel(eventID: eventID)
        eventDetailViewModel.coordinator = self
        detailViewController.viewModel = eventDetailViewModel
        navigationController.pushViewController(detailViewController, animated: true)
    }
    
    func didFinish() {
        parentCoordinator?.childDidFinished(self)
    }
    
    func onEditEvent(event: Event) {
        
    }
}
