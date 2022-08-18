//
//  TitleSubtitleCell.swift
//  Event Club
//
//  Created by Александр Прайд on 18.08.2022.
//

import UIKit

final class TitleSubtitleCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    let subtitleTextField = UITextField()
    private let stackView = UIStackView()
    
    private let leftConstant: CGFloat = 10
    
    private let datePickerView = UIDatePicker()
    private let toolBar = UIToolbar(frame: .init(x: 0, y: 0, width: 100, height: 50))
    
    lazy var doneButton: UIBarButtonItem = {
        UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tappedDone))
        
    }()
    
    private let photoImageView = UIImageView()
    
    private var viewModel: TitleSubtitleCellViewModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        
        setupViews()
        setupHierarchy()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with viewModel: TitleSubtitleCellViewModel) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
        subtitleTextField.text = viewModel.subtitle
        subtitleTextField.placeholder = viewModel.placeholder
        
        subtitleTextField.inputView = viewModel.type == .text ? nil : datePickerView
        subtitleTextField.inputAccessoryView = viewModel.type == .text ? nil : toolBar
        
        photoImageView.isHidden = viewModel.type != .image
        subtitleTextField.isHidden = viewModel.type == .image
    }
    
    private func setupViews() {
        stackView.axis = .vertical
        stackView.spacing = 15
        
        titleLabel.font = .systemFont(ofSize: 20, weight: .medium)
        titleLabel.textAlignment = .left
        titleLabel.textColor = .lightGray
        
        subtitleTextField.font = .systemFont(ofSize: 17, weight: .medium)
        subtitleTextField.textAlignment = .left
        
        
        [stackView, titleLabel, subtitleTextField].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        toolBar.setItems([doneButton], animated: false)
        datePickerView.preferredDatePickerStyle = .wheels
        datePickerView.datePickerMode = .date
        
        photoImageView.backgroundColor = .black.withAlphaComponent(0.4)
        photoImageView.layer.cornerRadius = 12
    }
    
    private func setupHierarchy() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleTextField)
        stackView.addArrangedSubview(photoImageView)
    }
    
    private func applyConstraints() {
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: leftConstant),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -leftConstant)
        ])
        
        photoImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    @objc private func tappedDone() {
        
        viewModel?.update(datePickerView.date)
    }
}

