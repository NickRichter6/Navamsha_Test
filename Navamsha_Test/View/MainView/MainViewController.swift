//
//  MainViewController.swift
//  Navamsha_Test
//
//  Created by Nick Ivanov on 31.01.2024.
//

import UIKit

// MARK: - Constants
private enum Constants {
    static var bgColor = UIColor(red: 16/255, green: 12/255, blue: 22/255, alpha: 1)
    
    static var buttonHeight = CGFloat(62)
    static var padding = CGFloat(19)
}

final class MainViewController: UIViewController {
    
// MARK: - Properties
    private lazy var openButton: CustomButton = {
        let button = CustomButton(style: .primary)
        button.addAction(UIAction(handler: { [weak self] _ in
            self?.openButtonTapped()
        }), for: .touchUpInside)
        return button
    }()
    
// MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
// MARK: - Private Funcs
    private func configureView() {
        view.backgroundColor = Constants.bgColor
        configureButton()
    }
    
    private func configureButton() {
        view.addSubview(openButton)
        NSLayoutConstraint.activate([
            openButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            openButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
            openButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.padding),
            openButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Constants.padding),
        ])
    }
    
    private func openButtonTapped() {
        let listViewController = ListViewController()
        listViewController.modalPresentationStyle = .custom
        listViewController.transitioningDelegate = self
        present(listViewController, animated: true)
    }
}
