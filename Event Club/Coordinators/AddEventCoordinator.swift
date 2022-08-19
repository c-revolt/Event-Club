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
    private var modalNavigationController: UINavigationController?
    
    var parentCoordinator: EventListCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        self.modalNavigationController = UINavigationController()
        let addEventViewController = AddEventViewController()
        let addEventViewModel = AddEventViewModel()
        modalNavigationController?.setViewControllers([addEventViewController], animated: false)
        addEventViewModel.coordinator = self
        addEventViewController.viewModel = addEventViewModel
        if let modalNavigationController = modalNavigationController {
            navigationController.present(modalNavigationController, animated: true, completion: nil)
        }
       
    }
    
    func didFinishedAddEvent() {
        parentCoordinator?.childDidFinished(self)
    }
    
    func showImagePicker(completion: @escaping (UIImage) -> Void) {
        
        guard let  modalNavigationController = modalNavigationController else {
            return
        }

        
        let imagePickerCoordinator = ImagePickerCoordinator(navigationController: modalNavigationController)
        childCoordinators.append(imagePickerCoordinator)
        imagePickerCoordinator.start()
        
    }
    
    func didFinishPicking(_ image: UIImage) {
        
    }
    
}
