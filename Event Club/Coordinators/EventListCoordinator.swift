//
//  EventListCoordinator.swift
//  Event Club
//
//  Created by Александр Прайд on 13.08.2022.
//

import UIKit

final class EventListCoordinator: Coordinator {
    
    private(set) var childCoordinator: [Coordinator] = []
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
        childCoordinator.append(addEventCoordinator)
        addEventCoordinator.start()
    }
}

