//
//  ControllerFactoryModule.swift
//  CleanArchitechture
//
//  Created by Subhra Roy on 28/05/21.
//

import Foundation
import UIKit

protocol FactoryProtocol {
    func initiateRoot(_ viewController: UIViewController?) -> UINavigationController?
}

struct ControllerFactory {
        
   static func creatRootViewController(_ storyBoard: UIStoryboard) -> ViewController?{
        if let _viewController : ViewController = storyBoard.instantiateViewController(identifier: "RootViewControllerIdentifier") as? ViewController{
            return _viewController
        }
        return nil
    }

    
}
