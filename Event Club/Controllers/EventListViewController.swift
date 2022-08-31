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
        
        setupViews()
        setupNavigationBar()
        
        
        viewModel.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.viewDidLoad()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
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
    
    private func setupViews() {
        view.addSubview(tableView)
        tableView.register(EventCell.self, forCellReuseIdentifier: EventCell.reusedID)
        tableView.dataSource = self
        
        
    }
    
    @objc private func tappedAddEventButton() {
     
        viewModel.tappedAddEvent()
    }
}
