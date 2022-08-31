//
//  EventListViewController + DataSource.swift
//  Event Club
//
//  Created by Александр Прайд on 28.08.2022.
//

import UIKit

extension EventListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch viewModel.cell(at: indexPath) {
            
        case .event(let eventCellViewModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: EventCell.reusedID,
                                                           for: indexPath) as? EventCell else {
                return UITableViewCell() }
            cell.update(with: eventCellViewModel)
            
            return cell
        }
    }
    
    
}
