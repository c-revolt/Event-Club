//
//  ImagePickerCoordinator.swift
//  Event Club
//
//  Created by Александр Прайд on 19.08.2022.
//

import UIKit

final class ImagePickerCoordinator: NSObject, Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    var parentCoordinator: AddEventCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let imagePickerContoller = UIImagePickerController()
        imagePickerContoller.delegate = self
        navigationController.present(imagePickerContoller, animated: true, completion: nil)
    }
    
    
}


