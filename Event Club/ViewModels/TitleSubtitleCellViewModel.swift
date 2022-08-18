//
//  TitleSubtitleCellViewModel.swift
//  Event Club
//
//  Created by Александр Прайд on 17.08.2022.
//

import UIKit

final class TitleSubtitleCellViewModel {
    let title: String
    private(set) var subtitle: String
    let placeholder: String
    
    init(title: String, subtitle: String, placeholder: String) {
        self.title = title
        self.subtitle = subtitle
        self.placeholder = placeholder
    }
    
    func update(_ subtitle: String) {
        self.subtitle = subtitle
    }
    
}

