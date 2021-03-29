//
//  HomeViewController.swift
//  unitTestExample
//
//  Created by Soda on 3/29/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK:-> Outlet
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    
    //MARK:-> Proprties

    var emailText = ""
    var passwordText = ""
    
    //MARK:-> Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupReciveDataProprties()

    }
    
    //MARK:-> Class Methods

    func setupReciveDataProprties() {
        emailLabel.text = emailText
        passwordLabel.text = passwordText
    }


}
