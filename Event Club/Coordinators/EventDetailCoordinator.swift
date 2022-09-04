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
    
    
    init(eventID: NSManagedObjectID, navigationController: UINavigationController) {
        self.eventID = eventID
        self.navigationController = navigationController
    }
    
    func start() {
        let detailViewController = EventDetailViewController()
        detailViewController.viewModel = EventDetailViewModel(eventID: eventID)
        navigationController.pushViewController(detailViewController, animated: true)
    }
}
