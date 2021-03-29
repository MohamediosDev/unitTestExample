//
//  HomeViewController.swift
//  unitTestExample
//
//  Created by Soda on 3/29/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    
    var emailText = ""
    var passwordText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupReciveDataProprties()

    }
    
    func setupReciveDataProprties() {
        emailLabel.text = emailText
        passwordLabel.text = passwordText
    }


}
