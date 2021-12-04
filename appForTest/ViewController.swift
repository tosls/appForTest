//
//  ViewController.swift
//  appForTest
//
//  Created by Антон Бобрышев on 04.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    var modulesFactory = ModulesFactoryImpl()
    var fieldsValidator = FieldValidatorImpl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTF.delegate = self
        passwordTF.delegate = self
        
        loginTF.returnKeyType = .continue
        passwordTF.returnKeyType = .done
    }
    
    func toNextScreen() {
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
            return
        }
        let screen = modulesFactory.getModule(bu: .main)
        
        sceneDelegate.window?.rootViewController = screen
        sceneDelegate.window?.makeKeyAndVisible()
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case loginTF:
            passwordTF.becomeFirstResponder()
        case passwordTF:
            passwordTF.resignFirstResponder()
            guard fieldsValidator.validateLoginsTextFields(loginTF: loginTF, passwordTF: passwordTF) else {
                let alert = UIAlertController(title: "Warning",
                                              message: "Invalid Fields",
                                              preferredStyle: .alert
                )
                let okAction = UIAlertAction(title: "Ok",
                                             style: .default,
                                             handler: nil
                )
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                break
            }
            toNextScreen()
        default:
            break
        }
        return true
    }
}
