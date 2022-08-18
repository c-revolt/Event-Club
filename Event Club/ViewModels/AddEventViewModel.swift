//
//  AddEventViewModel.swift
//  Event Club
//
//  Created by Александр Прайд on 16.08.2022.
//

import UIKit

final class AddEventViewModel {
    
    let title = "Add"
    var onUpdate: () -> Void = {}
    
    enum Cell {
        case titleSubtitle(TitleSubtitleCellViewModel)
    }
    
    private(set) var cells: [AddEventViewModel.Cell] = []
    var coordinator: AddEventCoordinator?
    
    func viewDidLoad() {
        cells = [
            .titleSubtitle(TitleSubtitleCellViewModel(title: "Name",
                                                      subtitle: "",
                                                      placeholder: "Add a name",
                                                      type: .text,
                                                      onCellUpdate: {})),
            .titleSubtitle(TitleSubtitleCellViewModel(title: "Date",
                                                      subtitle: "",
                                                      placeholder: "Select a date",
                                                      type: .date,
                                                      onCellUpdate: { [weak self] in
                                                          self?.onUpdate()
                                                      })),
            .titleSubtitle(TitleSubtitleCellViewModel(title: "Date",
                                                      subtitle: "",
                                                      placeholder: "Select a date",
                                                      type: .image,
                                                      onCellUpdate: { [weak self] in
                                                          self?.onUpdate()
                                                      }))
        ]
        
        onUpdate()
    }
    
    func viewDidDisappear() {
        coordinator?.didFinishedAddEvent()
    }
    
    func numberOfRows() -> Int {
        return cells.count
    }
    
    func cell(for indexPath: IndexPath) -> Cell {
        return cells[indexPath.row]
    }
    
    func tappedDone() {
        print("tapped done")
        // save in core data
    }
    
    func updateCell(indexPath: IndexPath, subtitle: String) {
        
        switch cells[indexPath.row] {
        case .titleSubtitle(let titleSubtitleViewModel):
            titleSubtitleViewModel.update(subtitle)
        }
    }
}
