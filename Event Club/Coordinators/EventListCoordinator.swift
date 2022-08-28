//
//  EventListCoordinator.swift
//  Event Club
//
//  Created by Александр Прайд on 13.08.2022.
//

import UIKit

final class EventListCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {

        let eventListViewController = EventListViewController()
        let eventListViewModel = EventListViewModel()
        eventListViewModel.coordinator = self
        eventListViewController.viewModel = eventListViewModel
        navigationController.setViewControllers([eventListViewController], animated: false)
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

