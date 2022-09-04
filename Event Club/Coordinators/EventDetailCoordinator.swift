//
//  EventDetailCoordinator.swift
//  Event Club
//
//  Created by Александр Прайд on 04.09.2022.
//

import UIKit

final class EventDetailCoordinator: Coordinator {
    
    let childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
}
