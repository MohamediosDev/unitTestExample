//
//  ViewController.swift
//  unitTestExample
//
//  Created by Soda on 3/29/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK:-> Outlet
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButtonOutlet: UIButton!
    
    //MARK:-> Properties
    
    private let dataBase = [User(uername: "Soda", password: "123456789")]
    private let validation : ValidationService
    
    init(validate:ValidationService) {
        self.validation = validate
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        self.validation = ValidationService()
        super.init(coder: coder)
    }
    
    
    //MARK:-> Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    //MARK:-> Class Methods
    
    func setupUI() {
        
        loginButtonOutlet.layer.cornerRadius = loginButtonOutlet.frame.height / 2
    }
    
    
    
    func ValidateTextField() {
        
        if emailTextField.text?.isEmpty == true {
            presentAlert(with: "Please Fill Email")
        }
        if passwordTextField.text?.isEmpty == true {
            presentAlert(with: "Please Fill Password")
        }
        
        do {
            
            let userName = try validation.validateEmail(emailTextField.text)
            let password = try validation.validatepassWord(passwordTextField.text)
            
            //Login To Server
            if let user = dataBase.first(where: { (user) -> Bool in
                user.uername == userName && user.password == password
            }) {
                makeAlertAndPassData(massage: "Success Login 🎉: \(user.uername)😍", user: userName, pass: password)
            }
            else {
                
                throw LoginError.invalidCredentials
            }
        }
        catch {
            present(error)
        }
    }
    
    func makeAlertAndPassData(massage:String? , user:String? , pass:String?) {
        
        let alert = UIAlertController(title: "Sucess🤙🏻", message: massage, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok,Go😇", style: .default) { [weak self] (alert) in
            guard let self = self else {return}
            let vc = self.storyboard?.instantiateViewController(withIdentifier:"HomeViewController") as! HomeViewController
            vc.emailText = "User😍: \(user ?? "")"
            vc.passwordText = "Pass🔥: \(pass ?? "")"
            self.present(vc, animated: true)
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    
    
    //MARK:-> IB Actions
    
    @IBAction func loginTapButton(_ sender: UIButton) {
        ValidateTextField()
    }
    
    
}
extension LoginViewController {
    
    enum LoginError : LocalizedError {
        case invalidCredentials
        
        var errorDescription: String? {
            switch self {
            case .invalidCredentials:
                return "Incorrect username or password. Please try again."
            }
        }
    }
}

