//
//  AddEventCoordinator.swift
//  Event Club
//
//  Created by Александр Прайд on 16.08.2022.
//

import UIKit

final class AddEventCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    var parentCoordinator: EventListCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let modalNavigationController = UINavigationController()
        let addEventViewController = AddEventViewController()
        let addEventViewModel = AddEventViewModel()
        modalNavigationController.setViewControllers([addEventViewController], animated: false)
        addEventViewModel.coordinator = self
        addEventViewController.viewModel = addEventViewModel
        navigationController.present(modalNavigationController, animated: true, completion: nil)
    }
    
    func didFinishedAddEvent() {
        parentCoordinator?.childDidFinished(self)
    }
    
}
