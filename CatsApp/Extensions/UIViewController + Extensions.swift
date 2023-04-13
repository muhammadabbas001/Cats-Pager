//
//  UIViewController + Extensions.swift
//  CatsApp
//
//  Created by Zeeshan Suleman on 27/03/2023.
//

import UIKit

extension UIViewController{
    class func create(storyboard: String) -> Self {
        return createFromStoryboard(storyboard: storyboard)
    }

    private class func createFromStoryboard<T>(storyboard: String) -> T {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! T
        return controller
    }
    
    func dismissVC(animated: Bool = true) {
        presentingViewController?.dismiss(animated: animated, completion: nil)
    }
    
    func popVC(animated: Bool = true) {
        _ = navigationController?.popViewController(animated: animated)
    }
    
    func present(_ controller: UIViewController) {
        present(controller, animated: true)
    }

    func push(_ controller: UIViewController) {
        if let navVC = self as? UINavigationController {
            navVC.pushViewController(controller, animated: true)
        } else {
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
