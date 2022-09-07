//
//  EditEventCoordinator.swift
//  Event Club
//
//  Created by Александр Прайд on 07.09.2022.
//

import UIKit

final class EditEventCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    private var completion: (UIImage) -> Void = { _ in }
    
    var parentCoordinator: EventListCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let editEventViewController = EditEventViewController()
        let editEventViewModel = EditEventViewModel(cellBuilder: EventCellBuilder())
        editEventViewModel.coordinator = self
        editEventViewController.viewModel = editEventViewModel
        navigationController.present(modalNavigationController, animated: true, completion: nil)
       
    }
    
    func didFinish() {
        parentCoordinator?.childDidFinished(self)
    }
    
    func didFinishSaveEvenet() {
        parentCoordinator?.onSaveEvent()
    }
    
    func showImagePicker(completion: @escaping (UIImage) -> Void) {

        self.completion = completion
        let imagePickerCoordinator = ImagePickerCoordinator(navigationController: modalNavigationController)
        imagePickerCoordinator.parentCoordinator = self
        childCoordinators.append(imagePickerCoordinator)
        imagePickerCoordinator.start()
        
    }
    
    func didFinishPicking( _ image: UIImage) {
        
        completion(image)
        modalNavigationController?.dismiss(animated: true, completion: nil)
    }
    
    func childDidFinished(_ childCoordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }

    
}

