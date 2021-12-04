//
//  FieldValidator.swift
//  appForTest
//
//  Created by Антон Бобрышев on 04.12.2021.
//

import UIKit

protocol FieldValidator {
    
    func validateLoginsTextFields(loginTF: UITextField, passwordTF: UITextField) -> Bool
    
    func asyncValidateLoginsTextFields(loginTF: UITextField, passwordTF: UITextField, completion: @escaping (Bool) -> Void)
}

class FieldValidatorImpl: FieldValidator {
    
    func validateLoginsTextFields(loginTF: UITextField, passwordTF: UITextField) -> Bool {
        return loginTF.hasText && passwordTF.hasText && passwordTF.text == "qwerty"
    }
    
    func asyncValidateLoginsTextFields(loginTF: UITextField, passwordTF: UITextField, completion: @escaping (Bool) -> Void) {
        
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 1.5, execute: {
            
            DispatchQueue.main.async {
                let result = loginTF.hasText && passwordTF.hasText && passwordTF.text == "qwerty"
                completion(result)
            }
        })
    }
}
