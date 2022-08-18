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
        titleLabel.text = viewModel.title
        subtitleTextField.text = viewModel.subtitle
        subtitleTextField.placeholder = viewModel.placeholder
        
    }
    
    private func setupViews() {
        stackView.axis = .vertical
        
        titleLabel.font = .systemFont(ofSize: 22, weight: .medium)
        titleLabel.textAlignment = .left
        
        subtitleTextField.font = .systemFont(ofSize: 20, weight: .medium)
        subtitleTextField.textAlignment = .left
        
        [stackView, titleLabel, subtitleTextField].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupHierarchy() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleTextField)
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: leftConstant),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}

