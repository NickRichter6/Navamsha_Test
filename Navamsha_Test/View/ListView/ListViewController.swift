//
//  ListViewController.swift
//  Navamsha_Test
//
//  Created by Nick Ivanov on 31.01.2024.
//

import UIKit

// MARK: - Constants
private enum Constants {
    static var bgColor = UIColor(red: 30/255, green: 24/255, blue: 38/255, alpha: 1)
    
    static var padding = CGFloat(19)
    static var buttonHeight = CGFloat(62)
    static var rowHeight = CGFloat(68)
    
    static var headerHeight = CGFloat(90)
    
    static var cellIdent = "cell"
}

final class ListViewController: UIViewController {
    
// MARK: - Private Properties
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: Constants.cellIdent)
        return tableView
    }()
    
    private lazy var shuffleButton: CustomButton = {
        let button = CustomButton(style: .secondary)
        button.addAction(UIAction(handler: { [weak self] _ in
            self?.shuffleButtonTapped()
        }), for: .touchUpInside)
        return button
    }()
    
    private var mantras: [Mantra]? {
        didSet {
            guard (mantras != nil) else { return }
            tableView.reloadData()
        }
    }
    
// MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        mantras = PlistManager.getMantras()
        configureView()
    }
    
// MARK: - Private Funcs
    private func configureView() {
        view.backgroundColor = Constants.bgColor
        configureShuffleButton()
        configureTableView()
    }
    
    private func configureShuffleButton() {
        view.addSubview(shuffleButton)
        NSLayoutConstraint.activate([
            shuffleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shuffleButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
            shuffleButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.padding),
            shuffleButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Constants.padding),
            shuffleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.padding)
        ])
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: shuffleButton.topAnchor),
        ])
    }
    
    private func shuffleButtonTapped() {
        mantras?.shuffle()
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mantras?.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdent, for: indexPath) as? TableViewCell,
              let mantras = mantras else { return UITableViewCell() }
        let mantra = mantras[indexPath.row]
        cell.fillCell(string: mantra.name, duration: mantra.duration)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.rowHeight
    }
}

// MARK: - UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        Constants.headerHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        CustomHeader(frame: CGRect(x: .zero, y: .zero, width: tableView.bounds.width, height: Constants.headerHeight))
    }
}
