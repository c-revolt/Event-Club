//
//  EventListViewController.swift
//  Event Club
//
//  Created by Александр Прайд on 13.08.2022.
//

import UIKit

class EventListViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainThemeColor()
        
        setupNavigationBar()
        
    }
    
    private func setupNavigationBar() {
        
        navigationController?.navigationBar.barTintColor = .mainThemeColor()
        let plusImage = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: #selector(tappedPlusBarButton))
        
        barButtonItem.tintColor = .plusButtonColor()
        
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = "Events"
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc private func tappedPlusBarButton() {
     
        print("It's works!")
    }
}
