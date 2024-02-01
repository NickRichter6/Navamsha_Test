//
//  TableViewCell.swift
//  Navamsha_Test
//
//  Created by Nick Ivanov on 31.01.2024.
//

import UIKit


// MARK: - Constants
private enum Constants {
    static var bgColorView = UIColor(red: 45/255, green: 38/255, blue: 56/255, alpha: 1)
    static var bgColorContent = UIColor(red: 30/255, green: 24/255, blue: 38/255, alpha: 1)
    
    static var padding = CGFloat(16)
    static var bgHeight = CGFloat(62)
    static var bgBottompadding = CGFloat(3)
    
    static var bgCorner = CGFloat(22)
}

final class TableViewCell: UITableViewCell {
    
// MARK: - Private Properties
    private let backdroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constants.bgColorView
        view.layer.cornerRadius = Constants.bgCorner
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(named: ImageName.icon)
        return imgView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: Fonts.regular, size: 15)
        label.textColor = .white
        return label
    }()
    
    private var durationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: Fonts.regular, size: 12)
        label.textColor = .darkGray
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
// MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Private Funcs
    private func configureView() {
        contentView.backgroundColor = Constants.bgColorContent
        configureBackgroundView()
        configureIcon()
        configureDurationLabel()
        configureTitle()
    }
    
    private func configureBackgroundView() {
        addSubview(backdroundView)
        NSLayoutConstraint.activate([
            backdroundView.heightAnchor.constraint(equalToConstant: Constants.bgHeight),
            backdroundView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.bgBottompadding),
            backdroundView.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.padding),
            backdroundView.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.padding),
            backdroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.bgBottompadding)
        ])
    }
    
    private func configureIcon() {
        backdroundView.addSubview(iconImageView)
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: backdroundView.topAnchor),
            iconImageView.leftAnchor.constraint(equalTo: backdroundView.leftAnchor),
            iconImageView.bottomAnchor.constraint(equalTo: backdroundView.bottomAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: Constants.bgHeight),
        ])
    }
    
    private func configureDurationLabel() {
        backdroundView.addSubview(durationLabel)
        NSLayoutConstraint.activate([
            durationLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            durationLabel.rightAnchor.constraint(equalTo: backdroundView.rightAnchor, constant: -Constants.padding),
        ])
    }
    
    private func configureTitle() {
        backdroundView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            titleLabel.rightAnchor.constraint(equalTo: durationLabel.leftAnchor),
        ])
    }
    
// MARK: - Internal Funcs
    func fillCell(string: String, duration: Int) {
        titleLabel.text = string
        durationLabel.text = duration.secondsToMinutesString()
    }
}
