//
//  AddEventViewController.swift
//  Event Club
//
//  Created by Александр Прайд on 16.08.2022.
//

import UIKit

class AddEventViewController: UIViewController {
    
    var viewModel: AddEventViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainThemeColor()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        viewModel.viewDidDisappear()
    }
    
    deinit {
        print("deinit from add event controller")
    }
    
}
