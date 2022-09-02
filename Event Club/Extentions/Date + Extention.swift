//
//  Date + Extention.swift
//  Event Club
//
//  Created by Александр Прайд on 02.09.2022.
//

import Foundation

extension Date {
    
    func timeRemaining(until endDate: Date) -> String? {
        
        let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.allowedUnits = [.year, .month, .weekOfMonth, .day]
        dateComponentsFormatter.unitsStyle = .full
        return dateComponentsFormatter.string(from: self, to: endDate)
    }
}
