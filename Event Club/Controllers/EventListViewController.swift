//
//  EventListViewController.swift
//  Event Club
//
//  Created by Александр Прайд on 13.08.2022.
//

import UIKit

class EventListViewController: UIViewController {
    
    var viewModel: EventListViewModel!
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainThemeColor()
        
        setupNavigationBar()
        
    }
    
    
    
    private func setupNavigationBar() {
        
        navigationController?.navigationBar.barTintColor = .mainThemeColor()
        let plusImage = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: #selector(tappedAddEventButton))
        
        barButtonItem.tintColor = .buttonBlueColor()
        
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = viewModel.title
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc private func tappedAddEventButton() {
     
        viewModel.tappedAddEvent()
    }
}
