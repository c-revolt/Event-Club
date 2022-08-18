//
//  AddEventViewController.swift
//  Event Club
//
//  Created by Александр Прайд on 16.08.2022.
//

import UIKit

class AddEventViewController: UIViewController {
    
    var viewModel: AddEventViewModel!
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainThemeColor()
        
        setupTableView()
        applyConstraints()
        
        viewModel.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.viewDidLoad()
        
        setupNavigationBar()
        
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        tableView.frame = view.bounds
//    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        viewModel.viewDidDisappear()
        
    }
    
    private func setupNavigationBar() {
        
        navigationController?.navigationBar.barTintColor = .mainThemeColor()
        navigationItem.title = viewModel.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tappedDone))
        navigationItem.rightBarButtonItem?.tintColor = .buttonBlueColor()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        // навбар отображается не корректно,
        // не устанавливается большой заголовок
        // с помощью этой настройки
        // он чуть-чуть прокручивается вниз и получается большой заголовок
        //tableView.contentInsetAdjustmentBehavior = .never
        tableView.setContentOffset(.init(x: 0, y: -2), animated: false)
    }
    
    private func setupTableView() {
    
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.layer.cornerRadius = 12
        
        tableView.register(TitleSubtitleCell.self, forCellReuseIdentifier: "TitleSubtitleCell")
        
        
    }
    
    private func applyConstraints() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }
    
    // actions
    @objc private func tappedDone() {
        viewModel.tappedDone()
    }
    
}

extension AddEventViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellViewModel = viewModel.cell(for: indexPath)
        
        switch cellViewModel {
        case .titleSubtitle(let titleSubtitleCellViewModel):
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleSubtitleCell", for: indexPath) as? TitleSubtitleCell else {
                return UITableViewCell()
                
            }
            
            cell.update(with: titleSubtitleCellViewModel)
            return cell
            
        case .titleImage:
            return UITableViewCell()
        }
    }
    
    
}
