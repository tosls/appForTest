//
//  StoryboardFactory.swift
//  appForTest
//
//  Created by Антон Бобрышев on 04.12.2021.
//

import Foundation
import UIKit

protocol ModulesFactory {
    
    func getModule(bu type: Modules) -> UIViewController 
}

enum Modules {
    case main
    
}

class ModulesFactoryImpl: ModulesFactory {
    
    func getModule(bu type: Modules) -> UIViewController {
        switch type {
        case .main:
            return  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondController")
        }
    }
}
