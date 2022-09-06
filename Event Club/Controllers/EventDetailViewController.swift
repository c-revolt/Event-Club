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
    private let timeRemainingStackView = TimeRemainingStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        viewModel.onUpdate = { [weak self] in
            guard let self = self,
                  let timeRemainingViewModel = self.viewModel.timeRemainingViewModel else { return }
            self.backgroundImageView.image = self.viewModel.image
            self.timeRemainingStackView.upadate(with: timeRemainingViewModel)
        }
        
        viewModel.viewDidLoad()
        
        setupView()
        setupHierarchy()
        applyConstraints()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        viewModel.viewDidDisappear()
    }
    
    private func setupView() {
        backgroundImageView.contentMode = .scaleAspectFill
        timeRemainingStackView.setup()
    }
    
    private func setupHierarchy() {
        view.addSubview(backgroundImageView)
        view.addSubview(timeRemainingStackView)
    }
    
    private func applyConstraints() {
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        timeRemainingStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            timeRemainingStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timeRemainingStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        
    }
    
}
