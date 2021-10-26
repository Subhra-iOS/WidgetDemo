//
//  SceneDelegate+Navigation.swift
//  CleanArchitechture
//
//  Created by Subhra Roy on 28/05/21.
//

import Foundation
import  UIKit

extension SceneDelegate: FactoryProtocol {
    
    func initiateRoot(_ viewController: UIViewController?) -> UINavigationController?{
        guard let controller = viewController else { return nil }
        let navigationController: UINavigationController = UINavigationController(rootViewController: controller)
        return  navigationController
    }
    
    
}
