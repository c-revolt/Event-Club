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
        let addEventViewController = AddEventViewController()
        let addEventViewModel = AddEventViewModel()
        addEventViewModel.coordinator = self
        addEventViewController.viewModel = addEventViewModel
        navigationController.present(addEventViewController, animated: true, completion: nil)
    }
    
    func didFinishedAddEvent() {
        parentCoordinator?.childDidFinished(self)
    }
    
    deinit {
        print("deinit from add event coordinator")
    }
    
    
}
