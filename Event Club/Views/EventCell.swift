//
//  EventCell.swift
//  Event Club
//
//  Created by Александр Прайд on 28.08.2022.
//

import UIKit

final class EventCell: UITableViewCell {
    
    static let reusedID = "EventCell"
    
    private let timeRemainingStackView = TimeRemainingStackView()
    private let dateLabel = UILabel()
    private let eventNameLabel = UILabel()
    private let backgroundImageView = UIImageView()
    private let verticalStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .mainThemeColor()
        setupViews()
        setupHierarchy()
        applyConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        timeRemainingStackView.setup()
        
        [dateLabel, eventNameLabel, backgroundImageView, verticalStackView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        dateLabel.font = .systemFont(ofSize: 22, weight: .medium)
        dateLabel.textColor = .white
        
        eventNameLabel.font = .systemFont(ofSize: 34, weight: .bold)
        eventNameLabel.textColor = .white
        
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .trailing
        
        backgroundImageView.layer.cornerRadius = 12
        backgroundImageView.clipsToBounds = true
    }
    
    private func setupHierarchy() {
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(verticalStackView)
        contentView.addSubview(eventNameLabel)
        
        verticalStackView.addArrangedSubview(timeRemainingStackView)
        verticalStackView.addArrangedSubview(UIView())
        verticalStackView.addArrangedSubview(dateLabel)

    }
    
    private func applyConstraints() {
        
        
        let bottomConstraint = backgroundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        bottomConstraint.priority = .required - 1
        bottomConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            backgroundImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            backgroundImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 250)

        ])
        
        NSLayoutConstraint.activate([
            eventNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25),
            eventNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25)
        ])
        
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25)
        ])
        
    }
     
    func update(with viewModel: EventCellViewModel) {
        if let timeRemainingViewModel = viewModel.timeRemainingViewModel {
            timeRemainingStackView.upadate(with: timeRemainingViewModel)
        }
        
        dateLabel.text = viewModel.dateText
        eventNameLabel.text = viewModel.eventName
        viewModel.loadImage { image in
            self.backgroundImageView.image = image
        }
        
    }
}
