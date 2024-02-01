//
//  CustomButton.swift
//  Navamsha_Test
//
//  Created by Nick Ivanov on 01.02.2024.
//

import UIKit

// MARK: - Constants
private enum Constants {
    static var primaryBgColor = UIColor(red: 118/255, green: 88/255, blue: 162/255, alpha: 1)
    static var buttonCornerRadious = CGFloat(22)
    
    static var imagePadding = CGFloat(10)
}

enum ButtonStyle {
    case primary
    case secondary
}

final class CustomButton: UIButton {
    
// MARK: - Private Properties
    private var style: ButtonStyle?
    
    init(style: ButtonStyle) {
        super.init(frame: .zero)
        self.style = style
        updateButtonStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        updateButtonStyle()
    }
// MARK: - Private Funcs
    private func updateButtonStyle() {
        guard let style = self.style else { return }
        switch style {
        case .primary:
            setTitle(ButtonTitle.primary, for: .normal)
            backgroundColor = Constants.primaryBgColor
            layer.cornerRadius = Constants.buttonCornerRadious
            titleLabel?.font = UIFont(name: Fonts.regular, size: 15)
            translatesAutoresizingMaskIntoConstraints = false
        case .secondary:
            configuration = setUpSecondaryConfig()
            backgroundColor = .clear
            layer.cornerRadius = Constants.buttonCornerRadious
            layer.borderWidth = 1
            layer.borderColor = UIColor.darkGray.cgColor
            translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

// MARK: - Extension
extension CustomButton {
    private func setUpSecondaryConfig() -> Configuration {
        var config = UIButton.Configuration.plain()
        let image = UIImage(named: ImageName.shuffle)
        config.image = image
        config.imagePadding = Constants.imagePadding
        let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.white,
                .font: UIFont(name: Fonts.regular, size: 15) as Any
            ]
        config.attributedTitle = AttributedString(ButtonTitle.secondary, attributes: AttributeContainer(attributes))
        return config
    }
}
