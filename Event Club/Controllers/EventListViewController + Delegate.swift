//
//  EventListViewController + Delegate.swift
//  Event Club
//
//  Created by Александр Прайд on 03.09.2022.
//

import UIKit

extension EventListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(at: indexPath)
    }
}
