//
//  UIImage + Extention.swift
//  Event Club
//
//  Created by Александр Прайд on 03.09.2022.
//

import UIKit

extension UIImage {
    
    // поскольку из-за большого размера подгружаемых изображений
    // главный экран подвисает, нужно уменьть размер подгружаемых изображений
    // данный метод будет использован в CoreDataManager
    // в методе saveEvent
    
    func sameAspectRation(newHeight: CGFloat) -> UIImage {
        // определяем масштаб
        let scale = newHeight / size.height
        // вычисляем новую ширину
        let newWidth = size.width / scale
        // вычисляем новый размер
        let newSize = CGSize(width: newWidth, height: newHeight)
        // рисуем изображение с новым размером
        return UIGraphicsImageRenderer(size: newSize).image { _ in
            self.draw(in: .init(origin: .zero, size: newSize))
        }
    }
}
