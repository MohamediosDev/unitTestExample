//
//  LoginViewController+Extentions.swift
//  unitTestExample
//
//  Created by Soda on 3/29/21.
//

import Foundation
import UIKit


extension UIViewController {
    
    private func present(_ dismissableAlert: UIAlertController) {
        let dismissAction = UIAlertAction(title: "OK", style: .cancel)
        dismissableAlert.addAction(dismissAction)
        present(dismissableAlert, animated: true)
    }
    
    func presentAlert(with message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        present(alert)
    }
    
    func present(_ error: Error) {
        presentAlert(with: error.localizedDescription)
    }
}
