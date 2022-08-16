//
//  AddEventViewModel.swift
//  Event Club
//
//  Created by Александр Прайд on 16.08.2022.
//

import Foundation

final class AddEventViewModel {
    
    var coordinator: AddEventCoordinator?
    
    func viewDidDisappear() {
        coordinator?.didFinishedAddEvent()
    }
    
    deinit {
        print("deinit from add event view model")
    }
}
