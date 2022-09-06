//
//  EventListCoordinator.swift
//  Event Club
//
//  Created by Александр Прайд on 13.08.2022.
//

import UIKit
import CoreData

final class EventListCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    private var navigationController: UINavigationController
    var onSaveEvent = {}
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {

        let eventListViewController = EventListViewController()
        let eventListViewModel = EventListViewModel()
        eventListViewModel.coordinator = self
        onSaveEvent = eventListViewModel.reload
        eventListViewController.viewModel = eventListViewModel
        navigationController.setViewControllers([eventListViewController], animated: false)
    }
    
    func onSelect(_ id: NSManagedObjectID) {
        let eventDetailCoordinator = EventDetailCoordinator(eventID: id, navigationController: navigationController)
        eventDetailCoordinator.parentCoordinator = self
        childCoordinators.append(eventDetailCoordinator)
        eventDetailCoordinator.start()
        
    }
    
    func startAddEvent() {
        let addEventCoordinator = AddEventCoordinator(navigationController: navigationController)
        addEventCoordinator.parentCoordinator = self
        childCoordinators.append(addEventCoordinator)
        addEventCoordinator.start()
    }
    
    func childDidFinished(_ childCoordinator: Coordinator) {
        
        
        
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
}

