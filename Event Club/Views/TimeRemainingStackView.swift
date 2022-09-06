//
//  TimeRemainingStackView.swift
//  Event Club
//
//  Created by Александр Прайд on 06.09.2022.
//

import UIKit

final class TimeRemainingStackView: UIStackView {
    
    private let timeRemainingLabels = [UILabel(), UILabel(), UILabel(), UILabel()]
    
    func setup() {
        timeRemainingLabels.forEach {
            addArrangedSubview($0)
        }
        
        axis = .vertical
    }
    
    func upadate(with viewModel: TimeRemainingViewModel) {
        
    }
}
