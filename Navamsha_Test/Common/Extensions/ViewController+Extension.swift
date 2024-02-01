//
//  ViewController+Extension.swift
//  Navamsha_Test
//
//  Created by Nick Ivanov on 01.02.2024.
//

import UIKit

extension UIViewController: UIViewControllerTransitioningDelegate {
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentationController = UISheetPresentationController(presentedViewController: presented, presenting: presenting)
        presentationController.detents = [.large()]
        return presentationController
    }
}
