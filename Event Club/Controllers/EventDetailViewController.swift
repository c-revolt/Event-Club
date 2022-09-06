//
//  EventDetailViewController.swift
//  Event Club
//
//  Created by Александр Прайд on 04.09.2022.
//

import UIKit

final class EventDetailViewController: UIViewController {
    
    private let backgroundImageView = UIImageView()
    var viewModel: EventDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        viewModel.onUpdate = { [weak self] in
            self?.backgroundImageView.image = self?.viewModel.image
        }
        
        viewModel.viewDidLoad()
        
        setupView()
        setupHierarchy()
        applyConstraints()
    }
    
    private func setupView() {
        backgroundImageView.contentMode = .scaleAspectFill
    }
    
    private func setupHierarchy() {
        view.addSubview(backgroundImageView)
    }
    
    private func applyConstraints() {
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        
    }
    
}
