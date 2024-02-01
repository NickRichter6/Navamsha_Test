//
//  CustomHeader.swift
//  Navamsha_Test
//
//  Created by Nick Ivanov on 31.01.2024.
//

import UIKit

private enum Constants {
    static var padding = CGFloat(16)
}

final class CustomHeader: UIView {
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: Fonts.header, size: 36)
        label.textAlignment = .left
        label.text = Header.secondary
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .clear
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.padding),
            label.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.padding),
        ])
    }
}
