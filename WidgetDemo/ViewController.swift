//
//  ViewController.swift
//  WidgetDemo
//
//  Created by Subhra Roy on 23/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func showAlert(){
        let alert: UIAlertController = UIAlertController(title: "Alert", message: "App open from widget", preferredStyle: .alert)
        let cancelAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.destructive) { _ in
            
        }
        
        alert.addAction(cancelAction)
        self.present(alert, animated: true) {
            
        }
    }

}

