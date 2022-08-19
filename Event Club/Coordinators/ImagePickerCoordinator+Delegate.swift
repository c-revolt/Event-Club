//
//  ImagePickerCoordinator+Delegate.swift
//  Event Club
//
//  Created by Александр Прайд on 19.08.2022.
//

import UIKit

extension ImagePickerCoordinator: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            parentCoordinator?.didFinishPicking(image)
        }
        
        parentCoordinator?.childDidFinished(self)
    }
}

extension ImagePickerCoordinator: UINavigationControllerDelegate {
    
}
